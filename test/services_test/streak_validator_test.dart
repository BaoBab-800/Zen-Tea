import 'package:flutter_test/flutter_test.dart';

import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/services/stats/streak_validator.dart';

import '../fakes/fake_stats_repository.dart';

Stats makeStats({
  int streakDays = 0,
  int maxStreak = 0,
  DateTime? lastCompletedAt,
}) {
  return Stats(
    totalServed: 0,
    uniqueTeas: 0,
    streakDays: streakDays,
    currentTeaServed: 0,
    rareTeasObtained: 0,
    legendaryTeasObtained: 0,
    totalQuestCompleted: 0,
    maxStreak: maxStreak,
    lastCompletedAt: lastCompletedAt,
  );
}

void main() {
  const validator = StreakValidator();

  group('resetExpiredStreak', () {
    test('keeps streak completed yesterday', () async {
      final now = DateTime(2026, 8, 14, 9);
      final initialStats = makeStats(
        streakDays: 5,
        maxStreak: 7,
        lastCompletedAt: DateTime(2026, 8, 13, 23),
      );
      final repository = FakeStatsRepository(initialStats);

      final result = await validator.resetExpiredStreak(
        repository: repository,
        stats: initialStats,
        now: now,
      );

      expect(result, initialStats);
      expect(repository.storedStats, initialStats);
    });

    test('resets streak when a day was missed', () async {
      final initialStats = makeStats(
        streakDays: 5,
        maxStreak: 7,
        lastCompletedAt: DateTime(2026, 8, 12, 23),
      );
      final repository = FakeStatsRepository(initialStats);

      final result = await validator.resetExpiredStreak(
        repository: repository,
        stats: initialStats,
        now: DateTime(2026, 8, 14, 9),
      );

      expect(result.streakDays, 0);
      expect(result.maxStreak, 7);
      expect(result.lastCompletedAt, initialStats.lastCompletedAt);
      expect(repository.storedStats, result);
    });
  });
}