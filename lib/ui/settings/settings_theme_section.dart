import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zentea/core/extensions/theme_mode_x.dart';
import 'package:zentea/core/l10n/l10n.dart';

import 'package:zentea/services/settings/settings_service.dart';

class SettingsThemeSection extends StatelessWidget {
  const SettingsThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsService>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
          child: Row(
            children: [
              const Icon(Icons.palette_outlined, size: 20),
              const SizedBox(width: 8),
              Text(
                context.l10n.theme,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        Card(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          clipBehavior: Clip.antiAlias,
          child: RadioGroup<ThemeMode>(
            groupValue: settings.themeMode,
            onChanged: (value) {
              if (value == null) return;
              settings.changeTheme(value);
            },

            child: Column(
              children: [
                for (final theme in ThemeMode.values)
                  RadioListTile<ThemeMode>(
                    dense: true,
                    value: theme,
                    title: Text(theme.label(context.l10n)),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}