import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_router.dart';
import '/core/l10n/l10n.dart';
import '/core/providers/providers.dart';
import '/core/theme/app_theme.dart';

class ZenTeaApp extends StatelessWidget {
  const ZenTeaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,

      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,

        title: 'Zen Tea',

        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,

        locale: L10n.defaultLocale,
        supportedLocales: L10n.supportedLocales,
        localizationsDelegates: L10n.localizationsDelegates,

        routerConfig: AppRouter.router,
      ),
    );
  }
}