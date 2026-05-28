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
        totalQuestCompleted: 0,
        maxStreak: 0,
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

  @override
  Future<void> onQuestCompleted({required int streak}) async {
    final stats = await getStats();

    final updated = stats.copyWith(
      totalQuestCompleted: stats.totalQuestCompleted + 1,
      streakDays: streak,
      maxStreak: streak > stats.maxStreak
          ? streak
          : stats.maxStreak,
    );

    await saveStats(updated);
  }
}