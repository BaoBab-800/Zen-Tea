import 'package:flutter/material.dart';

import 'settings_theme_section.dart';

class SettingsPageBuilder extends StatelessWidget {
  const SettingsPageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),

      body: ListView(
        children: [
          const SettingsThemeSection(),
        ],
      ),
    );
  }
}