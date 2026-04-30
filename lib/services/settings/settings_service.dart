import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsService extends ChangeNotifier {
  final Box _box = Hive.box('settings');

  late ThemeMode themeMode;
  late Locale locale;

  SettingsService() {
    _loadSettings();
  }

  void _loadSettings() {
    final themeIndex = _box.get('themeMode', defaultValue: 0);
    themeMode = ThemeMode.values[themeIndex];

    final localeCode = _box.get('locale', defaultValue: 'en');
    locale = Locale(localeCode);
  }

  Future<void> changeTheme(ThemeMode mode) async {
    themeMode = mode;
    await _box.put('themeMode', mode.index);
    notifyListeners();
  }

  Future<void> changeLocale(String code) async {
    locale = Locale(code);
    await _box.put('locale', code);
    notifyListeners();
  }
}