import 'package:zentea/data/stats/stats.dart';

abstract class IStatsService {
  Future<Stats> getStats();
  Future<void> updateStats(Stats stats);

  Future<void> updateStreak(int newStreak);
  Future<void> onQuestCompleted({required int streak});
}