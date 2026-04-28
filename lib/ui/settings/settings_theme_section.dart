import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zentea/core/extensions/theme_mode_x.dart';

import 'package:zentea/services/settings/settings_provider.dart';

class SettingsThemeSection extends StatelessWidget {
  const SettingsThemeSection({super.key});

  Future<void> showThemeDialog(BuildContext context) {
    final provider = context.read<SettingsProvider>();

    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Select Theme'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: ThemeMode.values.map((mode) {
              return RadioListTile<ThemeMode>(
                title: Text(mode.label),
                value: mode,
                groupValue: provider.themeMode,
                onChanged: (value) {
                  if (value != null) {
                    provider.changeTheme(value);
                    Navigator.pop(context);
                  }
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<SettingsProvider>().themeMode;

    return ListTile(
      title: Text(
        'Theme',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(themeMode.label),
      onTap: () => showThemeDialog(context),
    );
  }
}