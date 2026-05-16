import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:zentea/data/quest/quest_result.dart';

import '../achievements/achievements_service.dart';
import '../stats/stats_provider.dart';
import 'package:zentea/services/hive/hive_service.dart';

class QuestProgressService extends ChangeNotifier {
  static const _lastCompletedAtKey = 'lastCompletedAt';

  static const _boxName = 'quest_progress';

  final HiveService _hive;
  final StatsProvider statsProvider;
  final AchievementsService achievementsService;

  int _streak = 0;
  DateTime? _lastCompletedAt;

  int get streak => _streak;
  DateTime? get lastCompletedAt => _lastCompletedAt;

  QuestProgressService({
    required this.statsProvider,
    required this.achievementsService,
    required HiveService hiveService,
  }) : _hive = hiveService {
    unawaited(_load());
  }

  Future<QuestResult> completeQuest() async {
    final now = DateTime.now();

    if (_isSameDay(_lastCompletedAt, now)) {
      return QuestResult(
        streak: _streak,
        isNewRecord: false,
        status: QuestResultStatus.alreadyDoneToday,
      );
    }

    _streak = _isConsecutiveDay(_lastCompletedAt, now) ? _streak + 1 : 1;
    _lastCompletedAt = now;

    await statsProvider.setStreak(_streak);
    await _save();
    await statsProvider.onQuestCompleted(streak: _streak);
    await _unlockNewAchievements();
    notifyListeners();

    return QuestResult(
      streak: _streak,
      isNewRecord: false,
      status: QuestResultStatus.completed,
    );
  }

  Future<void> resetStreak() async {
    _streak = 0;
    _lastCompletedAt = null;
    await statsProvider.setStreak(0);
    await _save();
    notifyListeners();
  }

  Future<void> setStreak(int streak) async {
    _streak = streak.clamp(0, 1 << 30);
    await statsProvider.setStreak(_streak);
    await _save();
    notifyListeners();
  }

  Future<void> _load() async {
    if (!statsProvider.isInitialized) {
      await statsProvider.init();
    }

    _streak = statsProvider.stats.streakDays;
    final last = _hive.getOptional<String>(boxName: _boxName, key: _lastCompletedAtKey);

    if (last != null) {
      _lastCompletedAt = DateTime.parse(last);
    }

    notifyListeners();
  }

  Future<void> _unlockNewAchievements() async {
    final newUnlocked = achievementsService.checkAchievements(
      stats: statsProvider.stats,
      currentUnlocked: statsProvider.unlockedIds,
    );

    if (newUnlocked.isNotEmpty) {
      await statsProvider.addUnlocked(newUnlocked);
    }
  }

  Future<void> _save() async {
    await _hive.putValue(boxName: _boxName, key: _lastCompletedAtKey, value: _lastCompletedAt?.toIso8601String());
  }

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