import 'package:flutter_test/flutter_test.dart';

import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

import '../fakes/fake_stats_repository.dart';
import 'package:zentea/services/stats/stats_provider.dart';

void main() {
  late FakeStatsRepository repository;
  late StatsProvider provider;

  const emptyStats = Stats(
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

  final baseTea = TeaModel(
    type: TeaType.blackTea,
    imagePath: 'assets/tea.png',
    features: TeaFeatures.common,
    country: TeaCountries.china,
    url: Uri.parse('https://example.com'),
    timesServed: 0,
  );

  setUp(() {
    repository = FakeStatsRepository(emptyStats);

    provider = StatsProvider(
      repository,
      initialStats: emptyStats,
    );
  });

  group('load', () {
    test('loads stats from repository', () async {
      final expected = emptyStats.copyWith(
        totalServed: 15,
        uniqueTeas: 7,
        currentTeaServed: 4,
        rareTeasObtained: 2,
        legendaryTeasObtained: 1,
      );

      await repository.saveStats(expected);

      await provider.load();

      expect(provider.stats, expected);
    });

    test('notifies listeners', () async {
      var notified = false;

      provider.addListener(() {
        notified = true;
      });

      await provider.load();

      expect(notified, isTrue);
    });
  });

  group('updateStats', () {
    test('updates repository and provider state', () async {
      final updated = emptyStats.copyWith(
        totalServed: 10,
        uniqueTeas: 5,
      );

      await provider.updateStats(updated);

      expect(provider.stats, updated);
      expect(await repository.getStats(), updated);
    });

    test('notifies listeners', () async {
      var notified = false;

      provider.addListener(() {
        notified = true;
      });

      await provider.updateStats(emptyStats.copyWith(totalServed: 99));

      expect(notified, isTrue);
    });
  });

  group('onTeaOpened', () {
    final commonTea = baseTea;
    final rareTea = baseTea.copyWith(features: TeaFeatures.rare);
    final legendaryTea = baseTea.copyWith(features: TeaFeatures.legendary);

    test('increments totalServed and currentTeaServed', () async {
      await provider.onTeaOpened(commonTea, isNew: false);

      expect(provider.stats.totalServed, 1);
      expect(provider.stats.currentTeaServed, 1);
    });

    test('increments uniqueTeas for new tea', () async {
      await provider.onTeaOpened(commonTea, isNew: true);

      expect(provider.stats.uniqueTeas, 1);
    });

    test('does not increment uniqueTeas for existing tea', () async {
      await provider.onTeaOpened(commonTea, isNew: false);

      expect(provider.stats.uniqueTeas, 0);
    });

    test('increments rareTeasObtained for new rare tea', () async {
      await provider.onTeaOpened(rareTea, isNew: true);

      expect(provider.stats.rareTeasObtained, 1);
    });

    test('does not increment rareTeasObtained for existing rare tea', () async {
      await provider.onTeaOpened(rareTea, isNew: false);

      expect(provider.stats.rareTeasObtained, 0);
    });

    test('increments legendaryTeasObtained for new legendary tea', () async {
      await provider.onTeaOpened(legendaryTea, isNew: true);

      expect(provider.stats.legendaryTeasObtained, 1);
    });

    test('does not increment legendaryTeasObtained for existing legendary tea', () async {
      await provider.onTeaOpened(legendaryTea, isNew: false);

      expect(provider.stats.legendaryTeasObtained, 0);
    });

    test('saves updated stats to repository', () async {
      await provider.onTeaOpened(commonTea, isNew: true);

      final saved = await repository.getStats();

      expect(saved, provider.stats);
    });

    test('notifies listeners', () async {
      var notified = false;

      provider.addListener(() {
        notified = true;
      });

      await provider.onTeaOpened(commonTea, isNew: true);

      expect(notified, isTrue);
    });

    test('updates all counters for new rare tea', () async {
      await provider.onTeaOpened(rareTea, isNew: true);

      expect(
        provider.stats,
        emptyStats.copyWith(
          totalServed: 1,
          currentTeaServed: 1,
          uniqueTeas: 1,
          rareTeasObtained: 1,
        ),
      );
    });
  });
}