import 'package:flutter/foundation.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';

import 'package:zentea/data/stats/stats.dart';

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

  void addUnlocked(Set<IdKeys> newUnlocked) {
    final added = newUnlocked.difference(_unlockedIds);

    if (added.isEmpty) return;

    _unlockedIds.addAll(added);

    _saveUnlocked();

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