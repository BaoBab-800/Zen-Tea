import 'dart:math';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';

import 'package:zentea/data/achievements/list_of_achievements.dart';
import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/data/teas/list_of_teas.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'package:zentea/services/achievements/i_achievements_service.dart';
import 'package:zentea/services/calendar/calendar_activity_service.dart';
import 'package:zentea/services/profile/profile_provider.dart';
import 'package:zentea/services/quest_progress/quest_progress_service.dart';
import 'package:zentea/services/stats/i_stats_repository.dart';
import 'package:zentea/services/stats/stats_provider.dart';
import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';
import 'package:zentea/services/today_tea/i_today_tea_service.dart';

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
    final statsProvider = context.read<StatsProvider>();
    final achievementsService = context.read<IAchievementsService>();
    final teaService = context.read<ITeaCollectionService>();

    final unlockedAchievements = await achievementsService.loadUnlocked();

    return (
    _DevSnapshot(
      stats: statsProvider.stats,
      unlockedAchievements: unlockedAchievements.length,
    ),
    teaService,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<ITeaCollectionService>();
    context.watch<QuestProgressService>();
    context.watch<StatsProvider>();
    final profileProvider = context.watch<ProfileProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.developerRoom,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => warningDialog(context),
              );
            },

            icon: Icon(Icons.info_outline),
          ),
        ],
      ),

      body: FutureBuilder<(_DevSnapshot, ITeaCollectionService)>(
        future: _snapshot(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          final dev = data?.$1;
          final teaService = data?.$2;
          final stateDump = teaService?.dumpState() ?? 'Loading...';

          return SingleChildScrollView(
            child: Column(
              spacing: 6,
              children: [
                const SizedBox(height: 6),
                Center(child: Text(stateDump)),
                Center(
                  child: Text(
                    dev == null
                        ? 'Stats: loading...'
                        : 'Stats: served=${dev.stats.totalServed}, unique=${dev.stats.uniqueTeas}, '
                        'rare=${dev.stats.rareTeasObtained}, legendary=${dev.stats.legendaryTeasObtained}, '
                        'quests=${dev.stats.totalQuestCompleted}, '
                        'streak=${dev.stats.streakDays}, max=${dev.stats.maxStreak}, '
                        'achievements=${dev.unlockedAchievements}/${allAchievements.length} '
                        'lastCompletedAt=${dev.stats.lastCompletedAt} '
                        'HisPageIsFound=${profileProvider.profileStats.isHisPageFound} '
                        'DeveloperRoomIsFound=${profileProvider.profileStats.isDeveloperRoomFound}',
                  ),
                ),

                TextButton(
                  onPressed: _busy ? null : () => _run(_unlockAll),
                  child: Text(context.l10n.unlockAll),
                ),

                TextButton(
                  onPressed: _busy ? null : () => _run(_blockAll),
                  child: Text(context.l10n.blockAll),
                ),

                TextButton(
                  onPressed: _busy ? null : () => _run(_nextDay),
                  child: Text(context.l10n.nextDay),
                ),

                TextButton(
                  onPressed: _busy ? null : () => _run(_unlockAllAchievements),
                  child: Text(context.l10n.unlockAllAchievements),
                ),

                TextButton(
                  onPressed: _busy ? null : () => _run(_lockAllAchievements),
                  child: Text(context.l10n.lockAllAchievements),
                ),

                TextButton(
                  onPressed: _busy ? null : () => _run(_setRandomStreak),
                  child: Text(context.l10n.setRandomStreak),
                ),

                TextButton(
                  onPressed: _busy ? null : () => _run(_resetStreak),
                  child: Text(context.l10n.resetStreak),
                ),

                TextButton(
                  onPressed: _busy ? null : () => _run(_resetCalendar),
                  child: Text(context.l10n.resetCalendar),
                ),

                TextButton(
                  onPressed: _busy ? null : () => _run(_changeDeveloperRoomFlag),
                  child: Text(context.l10n.changeDeveloperRoomFlag),
                ),

                TextButton(
                  onPressed: _busy ? null : () => _run(_resetAllStats),
                  child: Text(context.l10n.resetAllStats),
                ),

                TextButton(
                  onPressed: _busy ? null : () => _run(_changeHisPageFlag),
                  child: Text('                      '),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget warningDialog(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.warning),
      content: Text(context.l10n.warningContent),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(context.l10n.ok),
        ),
      ],
    );
  }

  Future<void> _nextDay() async {
    final todayTeaService = context.read<ITodayTeaService>();

    await todayTeaService.debugAdvanceToNextDay();

    developer.log(
      'Daily tea state advanced to the next day',
      name: 'DeveloperRoom',
    );
  }

  Future<void> _unlockAll() async {
    final teaService = context.read<ITeaCollectionService>();
    final statsProvider = context.read<StatsProvider>();

    for (final tea in listOfTeas) {
      await teaService.setUnlocked(tea, true);
    }

    final rareTeasCount = listOfTeas
        .where((tea) => tea.features == TeaFeatures.rare)
        .length;
    final legendaryTeasCount = listOfTeas
        .where((tea) => tea.features == TeaFeatures.legendary)
        .length;
    final current = statsProvider.stats;

    await _unlockAllAchievements();
    await _updateStats(
      current.copyWith(
        uniqueTeas: listOfTeas.length,
        rareTeasObtained: rareTeasCount,
        legendaryTeasObtained: legendaryTeasCount,
      ),
    );

    developer.log('All teas has been unlocked', name: 'DeveloperRoom');
  }

  Future<void> _blockAll() async {
    final teaService = context.read<ITeaCollectionService>();
    final statsProvider = context.read<StatsProvider>();

    for (final tea in listOfTeas) {
      await teaService.setUnlocked(tea, false);
    }

    final current = statsProvider.stats;
    await _lockAllAchievements();
    await _updateStats(
      current.copyWith(
        uniqueTeas: 0,
        rareTeasObtained: 0,
        legendaryTeasObtained: 0,
      ),
    );

    developer.log('All teas has been blocked', name: 'DeveloperRoom');
  }

  Future<void> _setRandomStreak() async {
    final provider = context.read<StatsProvider>();
    final streakDays = Random().nextInt(30);
    final maxStreak = Random().nextInt(30);

    await _updateStats(
      provider.stats.copyWith(
        streakDays: streakDays,
        maxStreak: maxStreak,
      ),
    );

    developer.log('Streak $streakDays installed, max streak: $maxStreak', name: 'DeveloperRoom');
  }

  Future<void> _resetStreak() async {
    final statsProvider = context.read<StatsProvider>();
    await _updateStats(
      statsProvider.stats.copyWith(streakDays: 0, maxStreak: 0),
    );

    developer.log('Streak has been reset', name: 'DeveloperRoom');
  }

  Future<void> _resetCalendar() async {
    final calendarActivityService = context.read<CalendarActivityService>();

    await calendarActivityService.resetCalendar();

    developer.log('Calendar has been reset', name: 'DeveloperRoom');
  }

  Future<void> _resetAllStats() async {
    final profileProvider = context.read<ProfileProvider>();

    if (profileProvider.profileStats.isHisPageFound) await _changeHisPageFlag();
    if (profileProvider.profileStats.isDeveloperRoomFound) await _changeDeveloperRoomFlag();

    await _updateStats(_zeroStats());
    await _lockAllAchievements();

    developer.log('All values have been reset', name: 'DeveloperRoom');
  }

  Future<void> _updateStats(Stats stats) async {
    final statsRepository = context.read<IStatsRepository>();
    final statsProvider = context.read<StatsProvider>();

    await statsRepository.saveStats(stats);
    await statsProvider.load();
  }

  Future<void> _unlockAllAchievements() async {
    final achievementsService = context.read<IAchievementsService>();
    await achievementsService.saveUnlocked(
      allAchievements.map((a) => a.id).toSet(),
    );
  }

  Future<void> _lockAllAchievements() async {
    final achievementsService = context.read<IAchievementsService>();
    await achievementsService.saveUnlocked({});
  }

  Future<void> _changeHisPageFlag() async {
    final profileProvider = context.read<ProfileProvider>();
    final newFlag = !profileProvider.profileStats.isHisPageFound;

    await profileProvider.updateHisPageFlag(newFlag);
  }

  Future<void> _changeDeveloperRoomFlag() async {
    final profileProvider = context.read<ProfileProvider>();
    final newFlag = !profileProvider.profileStats.isDeveloperRoomFound;

    await profileProvider.updateDeveloperRoomFlag(newFlag);
  }

  Stats _zeroStats() => Stats(
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
}

class _DevSnapshot {
  final Stats stats;
  final int unlockedAchievements;

  const _DevSnapshot({
    required this.stats,
    required this.unlockedAchievements,
  });
}