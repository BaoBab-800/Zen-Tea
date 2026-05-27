import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:zentea/core/l10n/achievement_localization.dart';

import 'package:zentea/services/achievements/i_achievements_service.dart';
import 'package:zentea/services/achievements/achievements_service.dart';

import 'package:zentea/services/quest_progress/quest_progress_service.dart';

import 'package:zentea/services/settings/settings_service.dart';

import 'package:zentea/services/stats/i_stats_service.dart';
import 'package:zentea/services/stats/hive_stats_service.dart';
import 'package:zentea/services/stats/stats_provider.dart';

import 'package:zentea/services/storage/i_key_value_storage.dart';
import 'package:zentea/services/storage/hive_key_value_storage.dart';

import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';
import 'package:zentea/services/tea_collection/tea_collection_service.dart';

import 'package:zentea/services/today_tea/i_today_tea_service.dart';
import 'package:zentea/services/today_tea/today_tea_service_impl.dart';

List<SingleChildWidget> buildProviders() => [
  Provider<IKeyValueStorage>(
    create: (_) => HiveKeyValueStorage(Hive.box('app_storage')),
  ),

  Provider<IStatsService>(
    create: (_) => HiveStatsService(
      Hive.box('stats_box'),
    ),
  ),

  ChangeNotifierProvider<StatsProvider>(
    create: (context) => StatsProvider(context.read<IStatsService>()),
  ),

  Provider<IAchievementsService>(
    create: (context) => AchievementsService(context.read<IKeyValueStorage>()),
  ),

  Provider<ITodayTeaService>(
    create: (context) => TodayTeaServiceImpl(context.read<IKeyValueStorage>()),
  ),

  ChangeNotifierProvider<SettingsService>(
    create: (context) => SettingsService(context.read<IKeyValueStorage>()),
  ),

  ChangeNotifierProvider<ITeaCollectionService>(
    create: (context) => TeaCollectionService(context.read<IKeyValueStorage>()),
  ),

  ChangeNotifierProvider<QuestProgressService>(
    create: (context) => QuestProgressService(
      statsService: context.read<IStatsService>(),
      storage: context.read<IKeyValueStorage>(),
      achievementsService: context.read<IAchievementsService>(),
    ),
  ),

  Provider<AchievementLocalization>(
    create: (_) => AchievementLocalization(),
  ),
];