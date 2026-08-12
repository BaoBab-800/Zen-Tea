import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zentea/core/theme/app_palette.dart';
import 'package:zentea/core/l10n/l10n.dart';
import 'package:zentea/core/extensions/app_palette_x.dart';

import 'package:zentea/services/settings/settings_service.dart';

class SettingsAccentColorSection extends StatelessWidget {
  const SettingsAccentColorSection({super.key});

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
              const Icon(Icons.brush_outlined, size: 20),
              const SizedBox(width: 8),
              Text(
                context.l10n.accentColor,
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
          child: RadioGroup<AppPaletteType>(
            groupValue: settings.paletteType,
            onChanged: (value) {
              if (value == null) return;
              settings.changeAccentColor(value);
            },
            child: Column(
              children: [
                for (final palette in AppPaletteType.values)
                  RadioListTile<AppPaletteType>(
                    dense: true,
                    value: palette,
                    title: Row(
                      children: [
                        Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: AppPalette.get(palette).primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(palette.label(context.l10n)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}