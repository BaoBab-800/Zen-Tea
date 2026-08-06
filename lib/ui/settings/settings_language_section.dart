import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/services/settings/settings_service.dart';

class SettingsLanguageSection extends StatelessWidget {
  const SettingsLanguageSection({super.key});

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
              const Icon(Icons.language_rounded, size: 20),
              const SizedBox(width: 8),
              Text(
                context.l10n.language,
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
          child: RadioGroup<Locale>(
            groupValue: settings.locale,
            onChanged: (value) {
              if (value == null) return;
              settings.changeLocale(value.languageCode);
            },

            child: Column(
              children: [
                for (final language in L10n.supportedLocales)
                  RadioListTile<Locale>(
                    dense: true,
                    title: Text(language.languageCode.toUpperCase()),
                    value: language,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}