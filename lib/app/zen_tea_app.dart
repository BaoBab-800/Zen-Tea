import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zentea/services/settings/settings_service.dart';
import 'app_router.dart';
import '/core/l10n/l10n.dart';
import '/core/providers/providers.dart';
import '/core/theme/app_theme.dart';

class ZenTeaApp extends StatelessWidget {
  final SharedPreferences prefs;

  const ZenTeaApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: buildProviders(prefs),
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

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: settings.themeMode,

      locale: settings.locale,
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.localizationsDelegates,

      routerConfig: AppRouter.router,
    );
  }
}