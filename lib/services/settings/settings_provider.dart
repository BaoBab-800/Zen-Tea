import 'package:flutter/material.dart';

import 'settings_service.dart';

class SettingsProvider extends ChangeNotifier {
  final SettingsService service;

  late ThemeMode themeMode;
  late Locale locale;

  SettingsProvider(this.service) {
    themeMode = service.getThemeMode();
    locale = Locale(service.getLocale());
  }

  Future<void> changeTheme(ThemeMode mode) async {
    themeMode = mode;
    await service.setThemeMode(mode);
    notifyListeners();
  }

  Future<void> changeLocale(String code) async {
    locale = Locale(code);
    await service.setLocale(code);
    notifyListeners();
  }
}