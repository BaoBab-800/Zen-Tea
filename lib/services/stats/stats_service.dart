import 'package:zentea/data/stats/stats.dart';

abstract class StatsService {
  Future<Stats> getStats();
  Future<void> updateStats(Stats stats);
}