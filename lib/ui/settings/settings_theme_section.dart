import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/extensions/theme_mode_x.dart';

import 'package:zentea/services/settings/settings_service.dart';

class SettingsThemeSection extends StatelessWidget {
  const SettingsThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsService>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(indent: 6, endIndent: 6),

        ListTile(
          title: Text(
            context.l10n.theme,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        for(final theme in ThemeMode.values)
          RadioListTile<ThemeMode>(
            title: Text(theme.label(context.l10n)),
            value: theme,
            groupValue: settings.themeMode,
            onChanged: (value) {
              if (value == null) return;

              settings.changeTheme(value);
            },
          ),
      ],
    );
  }
}