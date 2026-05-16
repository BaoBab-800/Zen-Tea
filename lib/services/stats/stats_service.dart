import 'package:hive_flutter/hive_flutter.dart';
import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/services/hive/hive_service.dart';

class StatsService {
  static const _boxName = 'stats_box';
  static const _statsKey = 'stats';

  final HiveService _hive;

  StatsService(this._hive);

  Stats getStats() {
    return _hive.getOptional<Stats>(boxName: _boxName, key: _statsKey) ?? _emptyStats();
  }

  Future<void> saveStats(Stats stats) {
    return _hive.putValue(boxName: _boxName, key: _statsKey, value: stats);
  }

  Stream<BoxEvent> watchStats() {
    return _hive.box<dynamic>(_boxName).watch(key: _statsKey);
  }

  Stats _emptyStats() => const Stats(
    totalServed: 0,
    uniqueTeas: 0,
    streakDays: 0,
    currentTeaServed: 0,
    rareTeasObtained: 0,
    totalQuestCompleted: 0,
    maxStreak: 0,
  );
}