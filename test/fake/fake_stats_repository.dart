import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/services/stats/i_stats_repository.dart';

class FakeStatsRepository implements IStatsRepository {
  Stats storedStats;

  FakeStatsRepository(this.storedStats);

  @override
  Future<Stats> getStats() async {
    return storedStats;
  }

  @override
  Future<void> saveStats(Stats stats) async {
    storedStats = stats;
  }
}