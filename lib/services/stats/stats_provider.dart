import 'package:flutter/foundation.dart';

import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'i_stats_repository.dart';

class StatsProvider extends ChangeNotifier {
  final IStatsRepository _statsRepository;
  final Set<IdKeys> _unlockedIds = <IdKeys>{};

  Stats _stats;

  StatsProvider(this._statsRepository, {required Stats initialStats})
      : _stats = initialStats;

  Stats get stats => _stats;
  Set<IdKeys> get unlockedIds => _unlockedIds;

  Future<void> load() async {
    _stats = await _statsRepository.getStats();
    notifyListeners();
  }

  Future<void> onTeaOpened(TeaModel tea, {required bool isNew}) async {
    final stats = await _statsRepository.getStats();
    final isRareTea = tea.features != TeaFeatures.common;

    final updated = stats.copyWith(
      totalServed: stats.totalServed + 1,
      currentTeaServed: stats.currentTeaServed + 1,
      uniqueTeas: isNew ? stats.uniqueTeas + 1 : stats.uniqueTeas,
      rareTeasObtained: isRareTea
          ? stats.rareTeasObtained + 1
          : stats.rareTeasObtained,
    );

    await updateStats(updated);
  }

  Future<void> onTeaReceived(TeaModel tea, {required bool isNew}) async {
    final stats = await _statsRepository.getStats();
    final achieved = <IdKeys>{};

    if (stats.totalServed >= 10) {
      achieved.add(IdKeys.idServeTenTeasAchievement);
    }

    if (stats.rareTeasObtained > 0) {
      achieved.add(IdKeys.idGetRareTeaAchievement);
    }

    if (isNew || tea.timesServed > 0) {
      achieved.add(IdKeys.idFirstStepsAchievement);
    }

    _unlockedIds
      ..clear()
      ..addAll(achieved);

    notifyListeners();
  }

  Future<void> updateStats(Stats stats) async {
    await _statsRepository.saveStats(stats);
    notifyListeners();
  }
}