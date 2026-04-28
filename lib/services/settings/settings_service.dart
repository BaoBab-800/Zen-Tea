import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

class SettingsService {
  final Box box = Hive.box('settings');

  ThemeMode getThemeMode() {
    final index = box.get('themeMode', defaultValue: 0);
    return ThemeMode.values[index];
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await box.put('themeMode', mode.index);
  }

  String getLocale() {
    return box.get('locale', defaultValue: 'en');
  }

  Future<void> setLocale(String locale) async {
    await box.put('locale', locale);
  }
}