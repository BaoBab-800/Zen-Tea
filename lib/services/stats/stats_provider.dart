import 'package:flutter/foundation.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';

import 'package:zentea/data/stats/stats.dart';

import 'stats_service.dart';

class StatsProvider extends ChangeNotifier {
  final StatsService _service;
  final Set<IdKeys> _unlockedIds = {};

  Stats _stats = const Stats(
    totalServed: 0,
    uniqueTeas: 0,
    streakDays: 0,
    currentTeaServed: 0,
  );

  Stats get stats => _stats;

  StatsProvider(this._service);

  Future<void> init() async {
    _stats = _service.getStats();
    notifyListeners();
  }

  bool isUnlocked(IdKeys id) {
    return _unlockedIds.contains(id);
  }

  Future<void> _save(Stats newStats) async {
    _stats = newStats;
    await _service.saveStats(newStats);
    notifyListeners();
  }
}