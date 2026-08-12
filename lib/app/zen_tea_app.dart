import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_router.dart';

import '/core/l10n/l10n.dart';
import '/core/providers/providers.dart';
import '/core/theme/app_theme.dart';

import '/data/stats/stats.dart';
import '/data/profile/profile_stats.dart';

import '/services/settings/settings_service.dart';
import '/services/stats/i_stats_repository.dart';
import '/services/profile/i_profile_stats_repository.dart';

class ZenTeaApp extends StatelessWidget {
  final IStatsRepository statsRepository;
  final Stats initialStats;
  final IProfileStatsRepository profileStatsRepository;
  final ProfileStats initialProfile;

  const ZenTeaApp({
    super.key,
    required this.statsRepository,
    required this.initialStats,
    required this.profileStatsRepository,
    required this.initialProfile,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: buildProviders(
        statsRepository,
        initialStats,
        profileStatsRepository,
        initialProfile,
      ),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsService>();

    return MaterialApp.router(
      title: 'Zen Tea',

      theme: AppTheme.light(settings.accentColor),
      darkTheme: AppTheme.dark(settings.accentColor),
      themeMode: settings.themeMode,

      locale: settings.locale,
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.localizationsDelegates,

      routerConfig: AppRouter.router,
    );
  }
}