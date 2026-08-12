import 'package:flutter/material.dart';

import 'package:zentea/core/theme/app_color_scheme.dart';
import 'package:zentea/core/theme/app_palette.dart';

import 'package:zentea/services/storage/i_key_value_storage.dart';

class SettingsService extends ChangeNotifier {
  static const _themeKey = 'themeMode';
  static const _accentColorKey = 'accentColor';
  static const _localeKey = 'locale';

  final IKeyValueStorage storage;

  ThemeMode themeMode = ThemeMode.system;
  AppColorScheme accentColor = AppPalette.orange;
  Locale locale = const Locale('en');

  SettingsService(this.storage) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final themeIndex = await storage.get<int>(_themeKey) ?? 0;
    themeMode = ThemeMode.values[themeIndex];

    final localeCode = await storage.get<String>(_localeKey) ?? 'en';
    locale = Locale(localeCode);

    final paletteIndex = await storage.get<int>(_accentColorKey) ?? 0;
    accentColor = AppPalette.get(AppPaletteType.values[paletteIndex]);

    notifyListeners();
  }

  Future<void> changeTheme(ThemeMode mode) async {
    themeMode = mode;

    await storage.put<int>(_themeKey, mode.index);

    notifyListeners();
  }

  Future<void> changePalette(AppPaletteType palette) async {
    accentColor = AppPalette.get(palette);

    await storage.put(_accentColorKey, palette.name);

    notifyListeners();
  }

  Future<void> changeLocale(String code) async {
    locale = Locale(code);

    await storage.put<String>(_localeKey, code);

    notifyListeners();
  }
}