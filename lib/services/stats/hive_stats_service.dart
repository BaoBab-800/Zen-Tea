import 'package:hive/hive.dart';

import 'package:zentea/data/stats/stats.dart';

import 'i_stats_service.dart';

class HiveStatsService extends IStatsService {
  final Box<Stats> _box;

  HiveStatsService(this._box);

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
  Future<void> updateStats(Stats stats) async {
    await _box.put(_key, stats);
  }

  // --- STREAK ---

  @override
  Future<void> updateStreak(int streak) async {
    await _box.put(
      _key,
      _box.get(_key)!.copyWith(streakDays: streak),
    );
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

    await updateStats(updated);
  }
}