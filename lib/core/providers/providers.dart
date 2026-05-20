import 'package:hive/hive.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/achievement_localization.dart';

import 'package:zentea/services/achievements/i_achievements_service.dart';
import 'package:zentea/services/achievements/achievements_service.dart';

import 'package:zentea/services/quest_progress/quest_progress_service.dart';

import 'package:zentea/services/settings/settings_service.dart';

import 'package:zentea/services/stats/i_stats_service.dart';
import 'package:zentea/services/stats/stats_provider.dart';
import 'package:zentea/services/stats/hive_stats_service.dart';

import 'package:zentea/services/storage/i_key_value_storage.dart';
import 'package:zentea/services/storage/hive_key_value_storage.dart';

import 'package:zentea/services/tea_collection/tea_collection_service.dart';

import 'package:zentea/services/today_tea/today_tea_service.dart';
import 'package:zentea/services/today_tea/today_tea_service_impl.dart';

List<SingleChildWidget> buildProviders() => [
  Provider(
    create: (_) => AchievementsService(
      HiveKeyValueStorage(Hive.box<List>('achievements')),
    ),
  ),

  Provider(
    create: (_) => AchievementsService(
      HiveKeyValueStorage(Hive.box<List>('achievements')),
    ),
  ),

  Provider(
    create: (context) => StatsProvider(HiveStatsService()),
  ),

  Provider(
    create: (context) => HiveStatsService(),
  ),

  Provider<TodayTeaService>(
    create: (_) => TodayTeaServiceImpl(
      HiveKeyValueStorage(Hive.box('today_tea')),
    ),
  ),

  ChangeNotifierProvider(
    create: (_) => TeaCollectionService(
      HiveKeyValueStorage(Hive.box('tea_collection')),
    ),
  ),

  ChangeNotifierProvider(
    create: (ctx) => QuestProgressService(
      statsService: ctx.read<IStatsService>(),
      storage: ctx.read<IKeyValueStorage>(),
      achievementsService: ctx.read<IAchievementsService>(),
    ),
  ),

  Provider(
    create: (_) => AchievementLocalization(),
  ),

  ChangeNotifierProvider(
    create: (_) => SettingsService(
      HiveKeyValueStorage(Hive.box('settings')),
    ),
  ),
];