import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/services/stats/i_stats_repository.dart';

class StreakValidator {
  const StreakValidator();

  Future<Stats> resetExpiredStreak({
    required IStatsRepository repository,
    required Stats stats,
    DateTime? now,
  }) async {
    if (!_isStreakExpired(stats, now ?? DateTime.now())) return stats;

    final updatedStats = stats.copyWith(streakDays: 0);
    await repository.saveStats(updatedStats);
    return updatedStats;
  }

  bool _isStreakExpired(Stats stats, DateTime now) {
    if (stats.streakDays == 0) return false;

    final lastCompletedAt = stats.lastCompletedAt;
    if (lastCompletedAt == null) return true;

    final lastDate = DateTime(
      lastCompletedAt.year,
      lastCompletedAt.month,
      lastCompletedAt.day,
    );
    final today = DateTime(now.year, now.month, now.day);

    return today.difference(lastDate).inDays > 1;
  }
}