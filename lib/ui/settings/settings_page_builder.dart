import 'package:flutter/material.dart';
import 'package:zentea/core/l10n/l10n.dart';

import 'package:zentea/app/app_router.dart';
import 'settings_theme_section.dart';
import 'settings_language_section.dart';

class SettingsPageBuilder extends StatelessWidget {
  const SettingsPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.settings,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),

      body: ListView(
        children: [
          SettingsThemeSection(),
          SettingsLanguageSection(),
          _goToDeveloperRoom(context),
        ],
      ),
    );
  }

  Widget _goToDeveloperRoom(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.pushRoute(AppRoute.developer);
      },
      child: Text(context.l10n.goToDeveloperRoom),
    );
  }
}