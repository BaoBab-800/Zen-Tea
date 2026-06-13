import 'dart:developer' as developer;

import 'package:zentea/data/achievements/abstract_achievement.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/achievements/achievement_unlock_result.dart';
import 'package:zentea/data/achievements/list_of_achievements.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_result.dart';

import 'package:zentea/services/achievements/i_achievements_service.dart';
import 'package:zentea/services/stats/stats_provider.dart';
import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';
import 'package:zentea/services/today_tea/i_today_tea_service.dart';

class GetTeaFlowController {
  const GetTeaFlowController();

  Future<TeaResult> getTodayTea({
    required ITodayTeaService todayTeaService,
    required ITeaCollectionService teaCollectionService,
  }) async {
    final tea = await todayTeaService.getTeaOfToday(teaCollectionService.teas);

    final existingIndex = teaCollectionService.teas.indexWhere(
      (item) => item.type == tea.type,
    );

    final isNew = existingIndex == -1
        ? true
        : !teaCollectionService.teas[existingIndex].isUnlocked;
    final shouldCountServing =
        await todayTeaService.shouldCountServingForToday();

    await teaCollectionService.unlockTea(tea);

    if (shouldCountServing) {
      await teaCollectionService.incrementServed(tea);
    }

    final updated = teaCollectionService.teas.firstWhere(
      (item) => item.type == tea.type,
    );

    developer.log(
      'getTodayTea - isNew: $isNew, shouldCountServing: $shouldCountServing', name: 'GetTeaFlowController',
    );
    return TeaResult(
      tea: updated,
      isNew: isNew,
      shouldCountServing: shouldCountServing,
    );
  }

  Future<AchievementUnlockResult> processTeaReceived({
    required StatsProvider statsProvider,
    required IAchievementsService achievementsService,
    required TeaModel tea,
    required bool isNew,
    required bool shouldCountServing,
  }) async {
    final previousUnlocked = await achievementsService.loadUnlocked();

    if (shouldCountServing) {
      await statsProvider.onTeaOpened(tea, isNew: isNew);
    }

    final newUnlocked = achievementsService.checkAchievements(
      stats: statsProvider.stats,
      currentUnlocked: previousUnlocked,
    );

    if (newUnlocked.isNotEmpty) {
      await achievementsService.saveUnlocked({
        ...previousUnlocked,
        ...newUnlocked,
      });
    }

    return AchievementUnlockResult(
      previouslyUnlocked: previousUnlocked,
      newlyUnlocked: newUnlocked,
    );
  }

  Achievement getAchievementById(IdKeys id) {
    return allAchievements.firstWhere((a) => a.id == id);
  }
}
