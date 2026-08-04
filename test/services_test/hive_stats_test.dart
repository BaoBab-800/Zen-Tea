import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/services/stats/hive_stats_repository.dart';

void main() {
  late Directory tempStatsDirectory;
  late Box<Stats> box;
  late HiveStatsRepository repository;

  setUpAll(() async {
    tempStatsDirectory = await Directory.systemTemp.createTemp();
    Hive.init(tempStatsDirectory.path);
    Hive.registerAdapter(StatsAdapter());
  });

  setUp(() async {
    box = await Hive.openBox('test_stats_box');
    repository = HiveStatsRepository(box);
  });

  tearDown(() async {
    await box.deleteFromDisk();
    await tempStatsDirectory.delete(recursive: true);
  });

  group('HiveStatsRepository', () {
    test('returns initial stats when box is empty', () async {
      final stats = await repository.getStats();

      expect(box.isEmpty, isFalse);

      expect(box.get(HiveStatsRepository.statsKey), stats);

      expect(
        stats,
        Stats(
          totalServed: 0,
          uniqueTeas: 0,
          streakDays: 0,
          currentTeaServed: 0,
          rareTeasObtained: 0,
          legendaryTeasObtained: 0,
          totalQuestCompleted: 0,
          maxStreak: 0,
          lastCompletedAt: null,
        ),
      );
    });

    test('returns existing stats', () async {
      final expectedStats = Stats(
        totalServed: 1,
        uniqueTeas: 1,
        streakDays: 1,
        currentTeaServed: 1,
        rareTeasObtained: 1,
        legendaryTeasObtained: 1,
        totalQuestCompleted: 1,
        maxStreak: 1,
        lastCompletedAt: null,
      );

      await box.put(HiveStatsRepository.statsKey, expectedStats);

      final actualStats = await repository.getStats();

      expect(
        actualStats,
        expectedStats,
      );
    });

    test('saves stats to box', () async {
      final stats = Stats(
        totalServed: 2,
        uniqueTeas: 2,
        streakDays: 2,
        currentTeaServed: 2,
        rareTeasObtained: 2,
        legendaryTeasObtained: 2,
        totalQuestCompleted: 2,
        maxStreak: 2,
        lastCompletedAt: null,
      );
      await repository.saveStats(stats);
      expect(box.get(HiveStatsRepository.statsKey), stats);
    });
  });
}