import 'package:flutter/foundation.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';

import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'stats_service.dart';
import '../achievements/achievements_service.dart';

class StatsProvider extends ChangeNotifier {
  final StatsService _service;
  final Set<IdKeys> _unlockedIds = {};
  final AchievementsService achievementsService;

  Stats _stats = const Stats(
    totalServed: 0,
    uniqueTeas: 0,
    streakDays: 0,
    currentTeaServed: 0,
    rareTeasObtained: 0,
  );

  Stats get stats => _stats;
  Set<IdKeys> get unlockedIds => Set.unmodifiable(_unlockedIds);

  StatsProvider(this._service, this.achievementsService);

  Future<void> init() async {
    _stats = _service.getStats();
    _unlockedIds
      ..clear()
      ..addAll(achievementsService.loadUnlocked());
    notifyListeners();
  }

  bool isUnlocked(IdKeys id) {
    return _unlockedIds.contains(id);
  }

  void addUnlocked(Set<IdKeys> newUnlocked) async {
    final added = newUnlocked.difference(_unlockedIds);

    if (added.isEmpty) return;

    _unlockedIds.addAll(added);

    await _saveUnlocked();

    notifyListeners();
  }

  Future<void> onTeaOpened(TeaModel tea, {required bool isNew}) async {
    _stats = _stats.copyWith(
      totalServed: _stats.totalServed + 1,
      rareTeasObtained: tea.features == TeaFeatures.rare && isNew
          ? _stats.rareTeasObtained + 1
          : _stats.rareTeasObtained,
    );

    await _service.saveStats(_stats);

    final newUnlocked = achievementsService.checkAchievements(
      currentUnlocked: _unlockedIds,
      stats: _stats,
    );

    addUnlocked(newUnlocked);
    notifyListeners();
  }

  Future<void> _saveUnlocked() async {
    await achievementsService.saveUnlocked(_unlockedIds);
  }

  Future<void> save(Stats newStats) async {
    _stats = newStats;
    await _service.saveStats(newStats);
    notifyListeners();
  }
}