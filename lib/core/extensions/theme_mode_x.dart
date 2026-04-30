import 'package:flutter/material.dart';
import 'package:zentea/l10n/app_localizations.dart';

extension ThemeModeX on ThemeMode {
  String label(AppLocalizations l10n) => switch (this) {
    ThemeMode.system => l10n.themeSystem,
    ThemeMode.light => l10n.themeLight,
    ThemeMode.dark => l10n.themeDark,
  };
}