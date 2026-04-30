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
        const Divider(indent: 6, endIndent: 6),

        ListTile(
          title: Text(context.l10n.language),
        ),

        for(final language in L10n.supportedLocales)
          RadioListTile(
            title: Text(language.languageCode.toUpperCase()),
            value: language,
            groupValue: settings.locale,
            onChanged: (value) {
              if(value != null) {
                settings.changeLocale(value.languageCode);
              }
            },
          ),
      ],
    );
  }
}