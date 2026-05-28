import 'package:zentea/data/stats/stats.dart';

abstract class IStatsRepository {
  Future<Stats> getStats();
  Future<void> saveStats(Stats stats);
  Future<void> onQuestCompleted({required int streak});
}