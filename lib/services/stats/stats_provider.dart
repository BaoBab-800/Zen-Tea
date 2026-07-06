import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'i_stats_repository.dart';

class StatsProvider extends ChangeNotifier {
  final IStatsRepository _statsRepository;

  Stats _stats;

  StatsProvider(this._statsRepository, {required Stats initialStats})
      : _stats = initialStats;

  Stats get stats => _stats;

  Future<void> load() async {
    _stats = await _statsRepository.getStats();
    notifyListeners();
  }

  Future<void> onTeaOpened(TeaModel tea, {required bool isNew}) async {
    final stats = _stats;

    final isNewRareTea = isNew && tea.features == TeaFeatures.rare;
    final isNewLegendaryTea = isNew && tea.features == TeaFeatures.legendary;

    final updated = stats.copyWith(
      totalServed: stats.totalServed + 1,
      currentTeaServed: stats.currentTeaServed + 1,
      uniqueTeas: isNew ? stats.uniqueTeas + 1 : stats.uniqueTeas,
      rareTeasObtained: isNewRareTea
          ? stats.rareTeasObtained + 1
          : stats.rareTeasObtained,
      legendaryTeasObtained: isNewLegendaryTea
          ? stats.legendaryTeasObtained + 1
          : stats.legendaryTeasObtained,
    );

    await updateStats(updated);

    developer.log(
      'Stats updated on tea opened: $updated',
      name: 'StatsProvider',
    );
  }

  Future<void> updateStats(Stats stats) async {
    await _statsRepository.saveStats(stats);
    _stats = stats;
    notifyListeners();
  }
}