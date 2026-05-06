import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:zentea/data/quest/quest_result.dart';

import '../achievements/achievements_service.dart';
import '../stats/stats_provider.dart';

class QuestProgressService extends ChangeNotifier {
  static const _streakKey = 'streak';
  static const _lastCompletedAtKey = 'lastCompletedAt';

  final Box _box = Hive.box('quest_progress');
  final StatsProvider statsProvider;
  final AchievementsService achievementsService;

  int _streak = 0;
  DateTime? _lastCompletedAt;

  int get streak => _streak;
  DateTime? get lastCompletedAt => _lastCompletedAt;

  QuestProgressService({
    required this.statsProvider,
    required this.achievementsService,
  }) {
    _load();
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

    await _save();
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
    await _save();
    notifyListeners();
  }

  Future<void> setStreak(int streak) async {
    _streak = streak.clamp(0, 1 << 30);
    await _save();
    notifyListeners();
  }

  void _load() {
    _streak = _box.get(_streakKey, defaultValue: 0);
    final last = _box.get(_lastCompletedAtKey);

    if (last != null) {
      _lastCompletedAt = DateTime.parse(last);
    }
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
    await _box.put(_streakKey, _streak);
    await _box.put(_lastCompletedAtKey, _lastCompletedAt?.toIso8601String());
  }

  bool _isSameDay(DateTime? a, DateTime b) {
    if (a == null) return false;
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isConsecutiveDay(DateTime? last, DateTime now) {
    if (last == null) return false;
    return now.difference(last).inDays == 1;
  }
}