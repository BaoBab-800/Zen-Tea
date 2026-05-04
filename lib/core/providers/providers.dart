import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/achievement_localization.dart';

import 'package:zentea/services/quest_progress/quest_progress_service.dart';
import 'package:zentea/services/achievements/achievements_service.dart';
import 'package:zentea/services/settings/settings_service.dart';
import 'package:zentea/services/tea_collection/tea_collection_service.dart';
import 'package:zentea/services/today_tea/today_tea_service.dart';
import 'package:zentea/services/today_tea/today_tea_service_impl.dart';
import 'package:zentea/services/stats/stats_service.dart';
import 'package:zentea/services/stats/stats_provider.dart';

List<SingleChildWidget> buildProviders() => [
  Provider(
    create: (_) => AchievementsService(),
  ),

  Provider(
    create: (_) => StatsService()..init(),
  ),

  Provider<TodayTeaService>(
    create: (_) => TodayTeaServiceImpl(),
  ),

  ChangeNotifierProvider(
    create: (context) => StatsProvider(
      context.read<StatsService>(),
      context.read<AchievementsService>(),
    )..init(),
  ),

  ChangeNotifierProvider(
    create: (context) => QuestProgressService(
      achievementsService: context.read<AchievementsService>(),
      statsProvider: context.read<StatsProvider>(),
    ),
  ),

  Provider(
    create: (_) => AchievementLocalization(),
  ),

  ChangeNotifierProvider(
    create: (context) => TeaCollectionService(),
  ),

  ChangeNotifierProvider(
    create: (_) => SettingsService(),
  ),
];