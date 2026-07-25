import 'package:flutter/material.dart';

import 'package:zentea/core/l10n/l10n.dart';

import 'settings_theme_section.dart';
import 'settings_language_section.dart';
import 'settings_dev_button.dart';

class SettingsPageBuilder extends StatelessWidget {
  const SettingsPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.settings,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          const SettingsThemeSection(),
          const SettingsLanguageSection(),
          const SizedBox(height: 6),
          const Expanded(child: SizedBox()),
          const SettingsDevButton(),
        ],
      ),
    );
  }
}