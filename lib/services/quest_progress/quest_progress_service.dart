import 'package:flutter/foundation.dart';

import 'package:zentea/data/quest/quest_result.dart';

import '../storage/i_key_value_storage.dart';
import '../stats/i_stats_repository.dart';
import '../achievements/i_achievements_service.dart';
import 'i_quest_progress_service.dart';

class QuestProgressService extends ChangeNotifier implements IQuestProgressService {
  final IStatsRepository statsService;
  final IKeyValueStorage storage;
  final IAchievementsService achievementsService;

  static const _lastCompletedAtKey = 'lastCompletedAt';

  DateTime? _lastCompletedAt;

  @override
  DateTime? get lastCompletedAt => _lastCompletedAt;

  QuestProgressService({
    required this.statsService,
    required this.storage,
    required this.achievementsService,
  });

  @override
  Future<void> init() async {
    final last = await storage.get(_lastCompletedAtKey);

    _lastCompletedAt = last != null ? DateTime.parse(last) : null;
  }

  @override
  Future<QuestResult> completeQuest() async {
    final now = DateTime.now();

    if (_isSameDay(_lastCompletedAt, now)) {
      return QuestResult(
        status: QuestCompletionStatus.alreadyDoneToday,
      );
    }

    final stats = await statsService.getStats();
    final unlocked = await achievementsService.loadUnlocked();

    final newStreak = _isConsecutiveDay(_lastCompletedAt, now)
        ? stats.streakDays + 1
        : 1;

    final updatedStats = stats.copyWith(
      streakDays: newStreak,
      totalQuestCompleted: stats.totalQuestCompleted + 1,
      maxStreak: newStreak > stats.maxStreak
          ? newStreak
          : stats.maxStreak,
    );

    await statsService.saveStats(updatedStats);

    _lastCompletedAt = now;
    await storage.put(
      _lastCompletedAtKey,
      now.toIso8601String(),
    );

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

    notifyListeners();

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