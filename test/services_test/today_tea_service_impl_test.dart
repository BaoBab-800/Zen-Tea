import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';
import 'package:zentea/services/calendar/i_calendar_activity_service.dart';
import 'package:zentea/services/stats/stats_provider.dart';
import 'package:zentea/services/storage/i_key_value_storage.dart';
import 'package:zentea/services/today_tea/today_tea_service_impl.dart';

import '../fakes/fake_stats_repository.dart';

class MockKeyValueStorage extends Mock implements IKeyValueStorage {}

class MockCalendarActivityService extends Mock implements ICalendarActivityService {}

void main() {
  late MockKeyValueStorage storage;
  late FakeStatsRepository statsRepository;
  late StatsProvider statsProvider;
  late MockCalendarActivityService calendarActivityService;
  late TodayTeaServiceImpl service;

  const initialStats = Stats(
    totalServed: 0,
    uniqueTeas: 0,
    streakDays: 0,
    currentTeaServed: 0,
    rareTeasObtained: 0,
    legendaryTeasObtained: 0,
    totalQuestCompleted: 0,
    maxStreak: 0,
  );

  TeaModel makeTea(TeaType type, {TeaFeatures features = TeaFeatures.common}) {
    return TeaModel(
      type: type,
      imagePath: 'assets/teas/${type.name}.jpg',
      features: features,
      country: TeaCountries.china,
      url: Uri.parse('https://example.com/${type.name}'),
      timesServed: 0,
    );
  }

  setUpAll(() {
    registerFallbackValue(TeaType.blackTea);
  });

  setUp(() {
    storage = MockKeyValueStorage();
    statsRepository = FakeStatsRepository(initialStats);
    statsProvider = StatsProvider(statsRepository, initialStats: initialStats);
    calendarActivityService = MockCalendarActivityService();
    service = TodayTeaServiceImpl(
      storage,
      statsProvider,
      calendarActivityService,
    );
    when(
          () => calendarActivityService.recordTeaForToday(any()),
    ).thenAnswer((_) async {});
  });

  group('getTeaOfToday', () {
    test('throws StateError when tea list is empty', () async {
      expect(() => service.getTeaOfToday([]), throwsStateError);
    });

    test('returns saved tea for today and records it in calendar', () async {
      final today = DateTime.now();
      final todayKey =
          '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
      final teas = [
        makeTea(TeaType.blackTea),
        makeTea(TeaType.greenTea),
      ];
      when(
            () => storage.get<String>('tea_date'),
      ).thenAnswer((_) async => todayKey);
      when(
            () => storage.get<String>('tea_type'),
      ).thenAnswer((_) async => TeaType.greenTea.name);

      final result = await service.getTeaOfToday(teas);

      expect(result.type, TeaType.greenTea);
      verify(
            () => calendarActivityService.recordTeaForToday(TeaType.greenTea),
      ).called(1);
      verifyNever(() => storage.put<String>('tea_date', any()));
      verifyNever(() => storage.put<String>('tea_type', any()));
    });

    test('selects and saves a new tea when no saved tea exists for today', () async {
      final teas = [makeTea(TeaType.blackTea)];
      when(() => storage.get<String>('tea_date')).thenAnswer((_) async => null);
      when(() => storage.get<String>('tea_type')).thenAnswer((_) async => null);
      when(() => storage.put<String>(any(), any())).thenAnswer((_) async {});

      final result = await service.getTeaOfToday(teas);

      expect(result.type, TeaType.blackTea);
      verify(() => storage.put<String>('tea_date', any())).called(1);
      verify(() => storage.put<String>('tea_type', TeaType.blackTea.name)).called(1);
      verify(
            () => calendarActivityService.recordTeaForToday(TeaType.blackTea),
      ).called(1);
    });
  });

  group('shouldCountServingForToday', () {
    test('returns false when serving was already counted today', () async {
      final today = DateTime.now();
      final todayKey =
          '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
      when(
            () => storage.get<String>('served_date'),
      ).thenAnswer((_) async => todayKey);

      final result = await service.shouldCountServingForToday();

      expect(result, isFalse);
      verifyNever(() => storage.put<String>('served_date', any()));
    });

    test('stores today and returns true when serving was not counted today', () async {
      when(
            () => storage.get<String>('served_date'),
      ).thenAnswer((_) async => '2000-01-01');
      when(() => storage.put<String>('served_date', any())).thenAnswer((_) async {});

      final result = await service.shouldCountServingForToday();

      expect(result, isTrue);
      verify(() => storage.put<String>('served_date', any())).called(1);
    });
  });

  test('debugAdvanceToNextDay moves saved dates and last completion to yesterday', () async {
    when(() => storage.put<String>(any(), any())).thenAnswer((_) async {});

    await service.debugAdvanceToNextDay();

    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    expect(statsProvider.stats.lastCompletedAt, isNotNull);
    expect(statsProvider.stats.lastCompletedAt!.year, yesterday.year);
    expect(statsProvider.stats.lastCompletedAt!.month, yesterday.month);
    expect(statsProvider.stats.lastCompletedAt!.day, yesterday.day);
    verify(() => storage.put<String>('served_date', any())).called(1);
    verify(() => storage.put<String>('tea_date', any())).called(1);
  });

  test('getWeightedRandomTea returns the only tea in a one-item list', () {
    final tea = makeTea(TeaType.mintTea, features: TeaFeatures.legendary);

    final result = service.getWeightedRandomTea([tea]);

    expect(result, same(tea));
  });
}