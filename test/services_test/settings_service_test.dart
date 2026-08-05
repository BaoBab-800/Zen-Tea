import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:zentea/services/settings/settings_service.dart';
import 'package:zentea/services/storage/i_key_value_storage.dart';

class MockKeyValueStorage extends Mock implements IKeyValueStorage {}

void main() {
  late MockKeyValueStorage mockStorage;

  setUp(() {
    mockStorage = MockKeyValueStorage();
  });

  group('SettingsService Initialization', () {
    test('loads saved themes and locale from storage', () async {
      when(() => mockStorage.get<int>('themeMode')).thenAnswer((_) async => ThemeMode.dark.index);
      when(() => mockStorage.get<String>('locale')).thenAnswer((_) async => 'ru');

      final service = SettingsService(mockStorage);

      await Future<void>.delayed(Duration.zero);

      expect(service.themeMode, ThemeMode.dark);
      expect(service.locale, const Locale('ru'));
      verify(() => mockStorage.get<int>('themeMode')).called(1);
      verify(() => mockStorage.get<String>('locale')).called(1);
    });

    test('uses default values if the storage is empty', () async {
      when(() => mockStorage.get<int>('themeMode')).thenAnswer((_) async => null);
      when(() => mockStorage.get<String>('locale')).thenAnswer((_) async => null);

      final service = SettingsService(mockStorage);
      await Future<void>.delayed(Duration.zero);

      expect(service.themeMode, ThemeMode.system);
      expect(service.locale, const Locale('en'));
    });
  });

  group('SettingsService Actions', () {
    late SettingsService service;

    setUp(() async {
      when(() => mockStorage.get<int>('themeMode')).thenAnswer((_) async => 0);
      when(() => mockStorage.get<String>('locale')).thenAnswer((_) async => 'en');
      when(() => mockStorage.put<int>(any(), any())).thenAnswer((_) async {});
      when(() => mockStorage.put<String>(any(), any())).thenAnswer((_) async {});

      service = SettingsService(mockStorage);
      await Future<void>.delayed(Duration.zero);
    });

    test('changeTheme updates the theme, saves it to storage, and calls notifyListeners', () async {
      var notified = false;
      service.addListener(() => notified = true);

      await service.changeTheme(ThemeMode.light);

      expect(service.themeMode, ThemeMode.light);
      expect(notified, isTrue);
      verify(() => mockStorage.put<int>('themeMode', ThemeMode.light.index)).called(1);
    });

    test('changeLocale updates the locale, saves it to storage, and calls notifyListeners', () async {
      var notified = false;
      service.addListener(() => notified = true);

      await service.changeLocale('fr');

      expect(service.locale, const Locale('fr'));
      expect(notified, isTrue);
      verify(() => mockStorage.put<String>('locale', 'fr')).called(1);
    });
  });
}