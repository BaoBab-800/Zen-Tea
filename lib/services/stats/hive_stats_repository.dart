import 'package:hive/hive.dart';

import 'package:zentea/data/stats/stats.dart';

import 'i_stats_repository.dart';

class HiveStatsRepository extends IStatsRepository {
  final Box<Stats> _box;

  HiveStatsRepository(this._box);

  static const _key = 'stats';

  @override
  Future<Stats> getStats() async {
    if (_box.isEmpty) {
      final initialStats = Stats(
        totalServed: 0,
        uniqueTeas: 0,
        streakDays: 0,
        currentTeaServed: 0,
        rareTeasObtained: 0,
        legendaryTeasObtained: 0,
        totalQuestCompleted: 0,
        maxStreak: 0,
        lastCompletedAt: null,
      );
      await _box.put(_key, initialStats);
      return initialStats;
    }

    return _box.get(_key)!;
  }

  @override
  Future<void> saveStats(Stats stats) async {
    await _box.put(_key, stats);
  }
}