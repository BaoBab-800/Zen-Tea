import 'dart:async';

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
  StreamSubscription? _statsSubscription;
  bool _isInitialized = false;

  Stats _stats = const Stats(
    totalServed: 0,
    uniqueTeas: 0,
    streakDays: 0,
    currentTeaServed: 0,
    rareTeasObtained: 0,
    totalQuestCompleted: 0,
    maxStreak: 0,
  );

  Stats get stats => _stats;
  Set<IdKeys> get unlockedIds => Set.unmodifiable(_unlockedIds);
  bool get isInitialized => _isInitialized;

  StatsProvider(this._service, this.achievementsService);

  Future<void> init() async {
    if (_isInitialized) return;

    _stats = _service.getStats();
    _statsSubscription?.cancel();
    _statsSubscription = _service.watchStats().listen((event) {
      final value = event.value;
      if (value is Stats) {
        _stats = value;
        notifyListeners();
      }
    });
    _unlockedIds
      ..clear()
      ..addAll(achievementsService.loadUnlocked());

    _isInitialized = true;
    notifyListeners();
  }

  bool isUnlocked(IdKeys id) {
    return _unlockedIds.contains(id);
  }

  Future<void> addUnlocked(Set<IdKeys> newUnlocked) async {
    final added = newUnlocked.difference(_unlockedIds);

    if (added.isEmpty) return;

    _unlockedIds.addAll(added);

    await _saveUnlocked();

    notifyListeners();
  }

  Future<void> onTeaOpened(TeaModel tea, {required bool isNew}) async {
    _stats = _stats.copyWith(
      totalServed: _stats.totalServed + 1,
      uniqueTeas: isNew ? _stats.uniqueTeas + 1 : _stats.uniqueTeas,
    );

    notifyListeners();

    await _service.saveStats(_stats);

    await _checkAchievements();
  }

  Future<void> onTeaReceived(TeaModel tea, {required bool isNew}) async {
    _stats = _stats.copyWith(
      rareTeasObtained: tea.features == TeaFeatures.rare && isNew
          ? _stats.rareTeasObtained + 1
          : _stats.rareTeasObtained,
    );

    notifyListeners();

    await _service.saveStats(_stats);

    await _checkAchievements();
  }

  Future<void> _checkAchievements() async {
    final newUnlocked = achievementsService.checkAchievements(
      currentUnlocked: _unlockedIds,
      stats: _stats,
    );

    await addUnlocked(newUnlocked);
  }

  Future<void> _saveUnlocked() async {
    await achievementsService.saveUnlocked(_unlockedIds);
  }

  Future<void> onQuestCompleted({required int streak}) async {
    _stats = _stats.copyWith(
      totalQuestCompleted: _stats.totalQuestCompleted + 1,
      maxStreak: streak > _stats.maxStreak ? streak : _stats.maxStreak,
    );

    notifyListeners();

    await _service.saveStats(_stats);

    await _checkAchievements();
  }

  Future<void> setStreak(int streak) async {
    _stats = _stats.copyWith(
      streakDays: streak,
      maxStreak: streak > _stats.maxStreak ? streak : _stats.maxStreak,
    );

    notifyListeners();

    await _service.saveStats(_stats);

    await _checkAchievements();
  }

  Future<void> resetStats() async {
    _stats = const Stats(
      totalServed: 0,
      uniqueTeas: 0,
      streakDays: 0,
      currentTeaServed: 0,
      rareTeasObtained: 0,
      totalQuestCompleted: 0,
      maxStreak: 0,
    );

    _unlockedIds.clear();

    notifyListeners();

    await _service.saveStats(_stats);

    await _saveUnlocked();
  }

  Future<void> save(Stats newStats) async {
    _stats = newStats;
    notifyListeners();
    await _service.saveStats(newStats);
  }

  @override
  void dispose() {
    _statsSubscription?.cancel();
    super.dispose();
  }
}