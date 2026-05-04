import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'package:zentea/data/quest/quest_result.dart';

import '../achievements/achievements_service.dart';
import '../stats/stats_provider.dart';

class QuestProgressService extends ChangeNotifier {
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

  void _load() {
    _streak = _box.get('streak', defaultValue: 0);
    final last = _box.get('lastCompletedAt');

    if (last != null) {
      _lastCompletedAt = DateTime.parse(last);
    }
  }

  Future<QuestResult> completeQuest() async {
    final now = DateTime.now();

    final stats = this.statsProvider.stats;
    final currentUnlocked = this.statsProvider.unlockedIds;

    if (_isSameDay(_lastCompletedAt, now)) {
      return QuestResult(
        streak: _streak,
        isNewRecord: false,
        status: QuestResultStatus.alreadyDoneToday,
      );
    }

    final isNewStreak = _isConsecutiveDay(_lastCompletedAt, now);

    _streak = isNewStreak ? _streak + 1 : 1;
    _lastCompletedAt = now;

    await _save();

    final newUnlocked = this.achievementsService.checkAchievements(
      stats: stats,
      currentUnlocked: currentUnlocked,
    );

    if (newUnlocked.isNotEmpty) {
      this.statsProvider.addUnlocked(newUnlocked);
    }

    notifyListeners();

    return QuestResult(
      streak: _streak,
      isNewRecord: false,
      status: QuestResultStatus.completed,
    );
  }

  Future<void> _save() async {
    await _box.put('streak', _streak);
    await _box.put('lastCompletedAt', _lastCompletedAt?.toIso8601String());
  }

  bool _isSameDay(DateTime? a, DateTime b) {
    if (a == null) return false;
    return a.year == b.year &&
        a.month == b.month &&
        a.day == b.day;
  }

  bool _isConsecutiveDay(DateTime? last, DateTime now) {
    if (last == null) return false;
    return now.difference(last).inDays == 1;
  }

  // Developer
  Future<void> resetStreak() async {
    _streak = 0;
    _lastCompletedAt = null;
    await _save();
    notifyListeners();
  }

  Future<void> setStreak(int streak) async {
    _streak = streak;
    await _save();
    notifyListeners();
  }
}