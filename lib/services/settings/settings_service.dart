import 'package:flutter/material.dart';

import 'package:zentea/services/hive/hive_service.dart';

class SettingsService extends ChangeNotifier {
  static const _boxName = 'settings';

  final HiveService _hive;

  late ThemeMode themeMode;
  late Locale locale;

  SettingsService(this._hive) {
    _loadSettings();
  }

  void _loadSettings() {
    final themeIndex = _hive.getValue<int>(boxName: _boxName, key: 'themeMode', defaultValue: 0);
    themeMode = ThemeMode.values[themeIndex];

    final localeCode = _hive.getValue<String>(boxName: _boxName, key: 'locale', defaultValue: 'en');
    locale = Locale(localeCode);
  }

  Future<void> changeTheme(ThemeMode mode) async {
    themeMode = mode;
    await _hive.putValue(boxName: _boxName, key: 'themeMode', value: mode.index);
    notifyListeners();
  }

  Future<void> changeLocale(String code) async {
    locale = Locale(code);
    await _hive.putValue(boxName: _boxName, key: 'locale', value: code);
    notifyListeners();
  }
}
