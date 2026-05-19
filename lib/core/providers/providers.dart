import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/achievement_localization.dart';

import 'package:zentea/services/hive/hive_service.dart';
import 'package:zentea/services/quest_progress/i_quest_progress_service.dart';
import 'package:zentea/services/achievements/achievements_service.dart';
import 'package:zentea/services/settings/settings_service.dart';
import 'package:zentea/services/tea_collection/tea_collection_service.dart';
import 'package:zentea/services/today_tea/today_tea_service.dart';
import 'package:zentea/services/today_tea/today_tea_service_impl.dart';
import 'package:zentea/services/stats/stats_provider.dart';
import 'package:zentea/services/stats/hive_stats_service.dart';

List<SingleChildWidget> buildProviders() => [
  Provider(
    create: (_) => HiveService(),
  ),

  Provider (
    create: (context) => AchievementsService(context.read<HiveService>()),
  ),

  Provider(
    create: (context) => StatsProvider(HiveStatsService()),
  ),

  Provider<TodayTeaService>(
    create: (context) => TodayTeaServiceImpl(context.read<HiveService>()),
  ),

  ChangeNotifierProvider(
    create: (context) => TeaCollectionService(context.read<HiveService>()),
  ),

  ChangeNotifierProvider(
    create: (context) => QuestProgressService(),
  ),

  Provider(
    create: (_) => AchievementLocalization(),
  ),

  ChangeNotifierProvider(
    create: (context) => SettingsService(context.read<HiveService>()),
  ),
];