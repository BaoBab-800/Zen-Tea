import 'package:hive/hive.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/achievement_localization.dart';

import 'package:zentea/data/stats/stats.dart';

import 'package:zentea/services/achievements/i_achievements_service.dart';
import 'package:zentea/services/achievements/achievements_service.dart';

import 'package:zentea/services/quest_progress/quest_progress_service.dart';

import 'package:zentea/services/settings/settings_service.dart';

import 'package:zentea/services/stats/i_stats_service.dart';
import 'package:zentea/services/stats/hive_stats_service.dart';

import 'package:zentea/services/storage/i_key_value_storage.dart';
import 'package:zentea/services/storage/hive_key_value_storage.dart';

import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';
import 'package:zentea/services/tea_collection/tea_collection_service.dart';

List<SingleChildWidget> buildProviders() => [
  Provider<IKeyValueStorage>(
    create: (_) => HiveKeyValueStorage(
      Hive.box('app_storage'),
    ),
  ),

  Provider<IStatsService>(
    create: (_) => HiveStatsService(
      Hive.box<Stats>('stats_box'),
    ),
  ),

  Provider<IAchievementsService>(
    create: (ctx) => AchievementsService(
      ctx.read<IKeyValueStorage>(),
    ),
  ),

  ChangeNotifierProvider(
    create: (ctx) => QuestProgressService(
      statsService: ctx.read<IStatsService>(),
      storage: ctx.read<IKeyValueStorage>(),
      achievementsService: ctx.read<IAchievementsService>(),
    ),
  ),

  ChangeNotifierProvider<ITeaCollectionService>(
    create: (ctx) => TeaCollectionService(
      ctx.read<IKeyValueStorage>(),
    ),
  ),

  ChangeNotifierProvider(
    create: (_) => SettingsService(
      HiveKeyValueStorage(
        Hive.box('app_storage'),
      ),
    ),
  ),

  Provider(
    create: (_) => AchievementLocalization(),
  ),
];