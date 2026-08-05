import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/stats/stats.dart';

import 'package:zentea/services/achievements/achievements_service.dart';
import 'package:zentea/services/storage/i_key_value_storage.dart';

class MockKeyValueStorage extends Mock implements IKeyValueStorage {}
class MockStats extends Mock implements Stats {}

void main() {
  late MockKeyValueStorage mockStorage;
  late AchievementsService service;

  setUp(() {
    mockStorage = MockKeyValueStorage();
    service = AchievementsService(mockStorage);
  });

  group('loadUnlocked', () {
    test('returns empty set when storage returns null', () async {
      when(() => mockStorage.get('unlocked_achievements')).thenAnswer((_) async => null);

      final result = await service.loadUnlocked();

      expect(result, isEmpty);
      verify(() => mockStorage.get('unlocked_achievements')).called(1);
    });

    test('returns empty set when storage returns non-iterable data', () async {
      when(() => mockStorage.get('unlocked_achievements')).thenAnswer((_) async => 12345);

      final result = await service.loadUnlocked();

      expect(result, isEmpty);
    });

    test('parses valid string keys into Set<IdKeys>', () async {
      final validKeys = [
        IdKeys.idFirstStepsAchievement.key,
        IdKeys.idServeTenTeasAchievement.key,
      ];
      when(() => mockStorage.get('unlocked_achievements')).thenAnswer((_) async => validKeys);

      final result = await service.loadUnlocked();

      expect(
        result,
        equals({
          IdKeys.idFirstStepsAchievement,
          IdKeys.idServeTenTeasAchievement,
        }),
      );
    });

    test('filters out invalid string keys and non-string elements', () async {
      final mixedData = [
        IdKeys.idFirstStepsAchievement.key,
        'invalid_key_xyz', 123, null,
      ];

      when(() => mockStorage.get('unlocked_achievements')).thenAnswer((_) async => mixedData);

      final result = await service.loadUnlocked();

      expect(result, equals({IdKeys.idFirstStepsAchievement}));
    });
  });

  group('checkAchievements', () {
    test('returns newly unlocked achievements', () {
      final mockStats = MockStats();

      final result = service.checkAchievements(
        currentUnlocked: {},
        stats: mockStats,
      );

      expect(result, isA<Set<IdKeys>>());
    });

    test('does not return achievements that are already unlocked', () {
      final mockStats = MockStats();
      final alreadyUnlocked = {
        IdKeys.idFirstStepsAchievement,
        IdKeys.idServeTenTeasAchievement,
      };

      final result = service.checkAchievements(
        currentUnlocked: alreadyUnlocked,
        stats: mockStats,
      );

      expect(result.intersection(alreadyUnlocked), isEmpty);
    });
  });

  group('saveUnlocked', () {
    test('converts Set<IdKeys> to List<String> and saves to storage', () async {
      when(() => mockStorage.put<List<String>>('unlocked_achievements', any()))
          .thenAnswer((_) async {});

      final idsToSave = {
        IdKeys.idFirstStepsAchievement,
        IdKeys.idServeTenTeasAchievement,
      };
      await service.saveUnlocked(idsToSave);

      final expectedData = idsToSave.map((e) => e.key).toList();
      verify(() => mockStorage.put<List<String>>('unlocked_achievements', expectedData)).called(1);
    });
  });
}