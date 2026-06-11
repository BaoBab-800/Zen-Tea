import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

import 'package:zentea/data/quest/quest_result.dart';

import '../storage/i_key_value_storage.dart';
import '../stats/stats_provider.dart';
import '../achievements/i_achievements_service.dart';
import 'i_quest_progress_service.dart';

class QuestProgressService extends ChangeNotifier implements IQuestProgressService {
  final StatsProvider statsProvider;
  final IKeyValueStorage storage;
  final IAchievementsService achievementsService;

  QuestProgressService({
    required this.statsProvider,
    required this.storage,
    required this.achievementsService,
  });

  @override
  Future<QuestResult> completeQuest() async {
    final now = DateTime.now();
    final stats = statsProvider.stats;

    if (_isSameDay(stats.lastCompletedAt, now)) {
      developer.log('Quest already completed today, last completed at: ${stats.lastCompletedAt}', name: 'QuestProgressService');
      return QuestResult(
        status: QuestCompletionStatus.alreadyDoneToday,
      );
    }

    final unlocked = await achievementsService.loadUnlocked();

    developer.log('Old streak: ${stats.streakDays}, last completed at: ${stats.lastCompletedAt}', name: 'QuestProgressService');
    final newStreak = _isConsecutiveDay(stats.lastCompletedAt, now)
        ? stats.streakDays + 1
        : 1;
    developer.log('New streak calculated: $newStreak', name: 'QuestProgressService');

    final updatedStats = stats.copyWith(
      streakDays: newStreak,
      totalQuestCompleted: stats.totalQuestCompleted + 1,
      maxStreak: newStreak > stats.maxStreak
          ? newStreak
          : stats.maxStreak,
      lastCompletedAt: now,
    );

    await statsProvider.updateStats(updatedStats);

    final newUnlocked = achievementsService.checkAchievements(
      stats: updatedStats,
      currentUnlocked: unlocked,
    );

    if (newUnlocked.isNotEmpty) {
      await achievementsService.saveUnlocked({
        ...unlocked,
        ...newUnlocked,
      });
    }

    developer.log('Quest completed successfully', name: 'QuestProgressService');
    return QuestResult(
      status: QuestCompletionStatus.completed,
    );
  }

  // Auxiliary
  bool _isSameDay(DateTime? a, DateTime b) {
    if (a == null) return false;
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isConsecutiveDay(DateTime? last, DateTime now) {
    if (last == null) return false;

    final lastDate = DateTime(last.year, last.month, last.day);
    final nowDate = DateTime(now.year, now.month, now.day);

    return nowDate.difference(lastDate).inDays == 1;
  }
}