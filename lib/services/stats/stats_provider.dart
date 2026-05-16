import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:zentea/data/achievements/achievement_keys.dart';

import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'package:zentea/services/tea_collection/tea_collection_service.dart';

import 'stats_service.dart';
import '../achievements/achievements_service.dart';

class StatsProvider extends ChangeNotifier {
  final StatsService _service;
  final Set<IdKeys> _unlockedIds = {};
  final AchievementsService achievementsService;
  final TeaCollectionService teaCollectionService;
  StreamSubscription? _statsSubscription;

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

  StatsProvider(this._service, this.achievementsService, this.teaCollectionService);

  Future<void> init() async {
    _stats = _service.getStats();
    _statsSubscription?.cancel();
    _statsSubscription = _service.watchStats().listen((event) {
      final value = event.value;
      if (value is Stats) {
        _stats = value;
        notifyListeners();
      }
    });
    teaCollectionService.addListener(_syncServedAndUniqueFromCollection);
    _syncServedAndUniqueFromCollection();
    _unlockedIds
      ..clear()
      ..addAll(achievementsService.loadUnlocked());

    notifyListeners();
  }

  bool isUnlocked(IdKeys id) => _unlockedIds.contains(id);

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
    );

    notifyListeners();

    await _service.saveStats(_stats);

    await _checkAchievements();
  }

  Future<void> onTeaReceived(TeaModel tea, {required bool isNew}) async {
    _stats = _stats.copyWith(
      uniqueTeas: isNew ? _stats.uniqueTeas + 1 : _stats.uniqueTeas,
      rareTeasObtained: tea.features == TeaFeatures.rare && isNew
          ? _stats.rareTeasObtained + 1
          : _stats.rareTeasObtained,
    );

    notifyListeners();

    await _service.saveStats(_stats);

    await _checkAchievements();
  }

  void _syncServedAndUniqueFromCollection() {
    final teas = teaCollectionService.teas;
    final totalServed = teas.fold<int>(0, (sum, tea) => sum + tea.timesServed);
    final uniqueTeas = teas.where((tea) => tea.isUnlocked).length;

    if (_stats.totalServed == totalServed && _stats.uniqueTeas == uniqueTeas) {
      return;
    }

    _stats = _stats.copyWith(
      totalServed: totalServed,
      uniqueTeas: uniqueTeas,
    );

    notifyListeners();
    _service.saveStats(_stats);
  }

  Future<void> _checkAchievements() async {
    final newUnlocked = achievementsService.checkAchievements(
      currentUnlocked: _unlockedIds,
      stats: _stats,
    );

    await addUnlocked(newUnlocked);
  }

  Future<void> _saveUnlocked() async => await achievementsService.saveUnlocked(_unlockedIds);

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
    teaCollectionService.removeListener(_syncServedAndUniqueFromCollection);
    super.dispose();
  }
}