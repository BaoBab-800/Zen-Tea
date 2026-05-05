import 'package:hive/hive.dart';

import 'package:zentea/data/stats/stats.dart';

class StatsService {
  static const _boxName = 'stats_box';
  static const _statsKey = 'stats';

  late final Box<Stats> _box;

  void init() {
    _box = Hive.box<Stats>(_boxName);
  }

  Stats getStats() {
    return _box.get(_statsKey) ??
        const Stats(
          totalServed: 0,
          uniqueTeas: 0,
          streakDays: 0,
          currentTeaServed: 0,
          rareTeasObtained: 0,
        );
  }

  Future<void> saveStats(Stats stats) async {
    await _box.put(_statsKey, stats);
  }
}