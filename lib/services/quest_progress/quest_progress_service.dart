import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class QuestProgressService extends ChangeNotifier {
  final Box _box = Hive.box('quest_progress');

  int _streak = 0;
  DateTime? _lastCompletedAt;

  int get streak => _streak;
  DateTime? get lastCompletedAt => _lastCompletedAt;

  QuestProgressService() {
    _load();
  }

  void _load() {
    _streak = _box.get('streak', defaultValue: 0);
    final last = _box.get('lastCompletedAt');

    if (last != null) {
      _lastCompletedAt = DateTime.parse(last);
    }
  }

  Future<void> completeQuest() async {
    final now = DateTime.now();

    if (_isSameDay(_lastCompletedAt, now)) {
      return;
    }

    if (_isConsecutiveDay(_lastCompletedAt, now)) {
      _streak++;
    } else {
      _streak = 1;
    }

    _lastCompletedAt = now;

    await _save();

    notifyListeners();
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
  void resetStreak() {
    _streak = 0;
    _lastCompletedAt = null;
    _save();
    notifyListeners();
  }

  void setStreak(int streak) {
    _streak = streak;
    _save();
    notifyListeners();
  }
}