import 'package:zentea/data/achievements/abstract_achievement.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/achievements/list_of_achievements.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_result.dart';

import 'package:zentea/services/stats/stats_provider.dart';
import 'package:zentea/services/tea_collection/tea_collection_service.dart';
import 'package:zentea/services/today_tea/today_tea_service.dart';

class GetTeaFlowController {
  const GetTeaFlowController();

  Future<TeaResult> getTodayTea({
    required TodayTeaService todayTeaService,
    required TeaCollectionService teaCollectionService,
  }) async {
    final tea = await todayTeaService.getTeaOfToday(teaCollectionService.teas);

    final existingIndex = teaCollectionService.teas.indexWhere(
          (item) => item.type == tea.type,
    );

    final isNew = existingIndex == -1 ? true : !teaCollectionService.teas[existingIndex].isUnlocked;
    final shouldCountServing =
    await todayTeaService.shouldCountServingForToday();

    await teaCollectionService.unlockTea(tea);

    if (shouldCountServing) {
      await teaCollectionService.incrementServed(tea);
    }

    final updated = teaCollectionService.teas.firstWhere(
          (item) => item.type == tea.type,
    );

    return TeaResult(
      tea: updated,
      isNew: isNew,
      shouldCountServing: shouldCountServing,
    );
  }

  Future<Set<IdKeys>> processTeaReceived({
    required StatsProvider statsProvider,
    required TeaModel tea,
    required bool isNew,
    required bool shouldCountServing,
  }) async {
    final previousUnlocked = Set<IdKeys>.from(statsProvider.unlockedIds);
    if (shouldCountServing) {
      await statsProvider.onTeaOpened(tea, isNew: isNew);
    }
    await statsProvider.onTeaReceived(tea, isNew: isNew);
    return statsProvider.unlockedIds.difference(previousUnlocked);
  }

  Achievement getAchievementById(IdKeys id) {
    return allAchievements.firstWhere((a) => a.id == id);
  }
}