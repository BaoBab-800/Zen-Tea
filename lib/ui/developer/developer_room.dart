import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';

import 'package:zentea/data/achievements/list_of_achievements.dart';
import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/data/teas/list_of_teas.dart';

import 'package:zentea/services/achievements/i_achievements_service.dart';
import 'package:zentea/services/quest_progress/quest_progress_service.dart';
import 'package:zentea/services/stats/i_stats_repository.dart';
import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';

class DeveloperRoom extends StatefulWidget {
  const DeveloperRoom({super.key});

  @override
  State<DeveloperRoom> createState() => _DeveloperRoomState();
}

class _DeveloperRoomState extends State<DeveloperRoom> {
  bool _busy = false;

  Future<void> _run(Future<void> Function() action) async {
    if (_busy) return;

    setState(() => _busy = true);
    try {
      await action();
      if (!mounted) return;
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  Future<(_DevSnapshot, ITeaCollectionService)> _snapshot() async {
    final statsService = context.read<IStatsRepository>();
    final achievementsService = context.read<IAchievementsService>();
    final teaService = context.read<ITeaCollectionService>();

    final stats = await statsService.getStats();
    final unlockedAchievements = await achievementsService.loadUnlocked();

    return (
    _DevSnapshot(
      stats: stats,
      unlockedAchievements: unlockedAchievements.length,
    ),
    teaService,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<ITeaCollectionService>();
    context.watch<QuestProgressService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.developerRoom,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: FutureBuilder<(_DevSnapshot, ITeaCollectionService)>(
        future: _snapshot(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          final dev = data?.$1;
          final teaService = data?.$2;
          final stateDump = teaService?.dumpState() ?? 'Loading...';

          return ListView(
            children: [
              const SizedBox(height: 12),
              Center(child: Text(stateDump)),
              const SizedBox(height: 6),
              Center(
                child: Text(
                  dev == null
                      ? 'Stats: loading...'
                      : 'Stats: served=${dev.stats.totalServed}, unique=${dev.stats.uniqueTeas}, '
                      'rare=${dev.stats.rareTeasObtained}, quests=${dev.stats.totalQuestCompleted}, '
                      'streak=${dev.stats.streakDays}, max=${dev.stats.maxStreak}, '
                      'achievements=${dev.unlockedAchievements}/${allAchievements.length}',
                ),
              ),

              const SizedBox(height: 6),
              TextButton(
                onPressed: _busy ? null : () => _run(_resetAllValues),
                child: Text(context.l10n.resetAllValues),
              ),

              const SizedBox(height: 6),
              TextButton(
                onPressed: _busy ? null : () => _run(_unlockAll),
                child: Text(context.l10n.unlockAll),
              ),

              const SizedBox(height: 6),
              TextButton(
                onPressed: _busy ? null : () => _run(_blockAll),
                child: Text(context.l10n.blockAll),
              ),

              const SizedBox(height: 6),
              TextButton(
                onPressed: _busy ? null : () => _run(_setRandomStreak),
                child: Text(context.l10n.setRandomStreak),
              ),

              const SizedBox(height: 6),
              TextButton(
                onPressed: _busy ? null : () => _run(_resetStreak),
                child: Text(context.l10n.resetStreak),
              ),

              const SizedBox(height: 6),
              TextButton(
                onPressed: _busy ? null : () => _run(_resetAllStats),
                child: Text(context.l10n.resetAllStats),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _resetAllValues() async {
    final teaService = context.read<ITeaCollectionService>();
    final statsService = context.read<IStatsRepository>();

    for (final tea in listOfTeas) {
      await teaService.setServedCount(tea, 0);
      await teaService.setUnlocked(tea, false);
    }

    await statsService.saveStats(_zeroStats());
  }

  Future<void> _unlockAll() async {
    final teaService = context.read<ITeaCollectionService>();
    final statsService = context.read<IStatsRepository>();

    for (final tea in listOfTeas) {
      await teaService.setUnlocked(tea, true);
    }

    final current = await statsService.getStats();
    await statsService.saveStats(current.copyWith(uniqueTeas: listOfTeas.length));
  }

  Future<void> _blockAll() async {
    final teaService = context.read<ITeaCollectionService>();
    final statsService = context.read<IStatsRepository>();

    for (final tea in listOfTeas) {
      await teaService.setUnlocked(tea, false);
    }

    final current = await statsService.getStats();
    await statsService.saveStats(current.copyWith(uniqueTeas: 0));
  }

  Future<void> _setRandomStreak() async {
    final statsService = context.read<IStatsRepository>();
    await statsService.saveStats(
      (await statsService.getStats()).copyWith(
        streakDays: Random().nextInt(30),
        maxStreak: Random().nextInt(30),
      ),
    );
  }

  Future<void> _resetStreak() async {
    final statsService = context.read<IStatsRepository>();
    await statsService.saveStats(
      (await statsService.getStats()).copyWith(streakDays: 0, maxStreak: 0),
    );
  }

  Future<void> _resetAllStats() async {
    final statsService = context.read<IStatsRepository>();
    final achievementsService = context.read<IAchievementsService>();

    await statsService.saveStats(_zeroStats());
    await achievementsService.saveUnlocked({});
  }

  Stats _zeroStats() => Stats(
    totalServed: 0,
    uniqueTeas: 0,
    streakDays: 0,
    currentTeaServed: 0,
    rareTeasObtained: 0,
    totalQuestCompleted: 0,
    maxStreak: 0,
  );
}

class _DevSnapshot {
  final Stats stats;
  final int unlockedAchievements;

  const _DevSnapshot({
    required this.stats,
    required this.unlockedAchievements,
  });
}