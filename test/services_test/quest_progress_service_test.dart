import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:zentea/data/achievements/achievement_keys.dart';
import 'package:zentea/data/quest/quest_result.dart';
import 'package:zentea/data/stats/stats.dart';
import 'package:zentea/services/achievements/i_achievements_service.dart';
import 'package:zentea/services/quest_progress/quest_progress_service.dart';
import 'package:zentea/services/stats/stats_provider.dart';
import 'package:zentea/services/storage/i_key_value_storage.dart';

import '../fakes/fake_stats_repository.dart';

class MockAchievementsService extends Mock implements IAchievementsService {}

class MockKeyValueStorage extends Mock implements IKeyValueStorage {}

Stats makeStats({
  int streakDays = 0,
  int totalQuestCompleted = 0,
  int maxStreak = 0,
  DateTime? lastCompletedAt,
}) {
  return Stats(
    totalServed: 0,
    uniqueTeas: 0,
    streakDays: streakDays,
    currentTeaServed: 0,
    rareTeasObtained: 0,
    legendaryTeasObtained: 0,
    totalQuestCompleted: totalQuestCompleted,
    maxStreak: maxStreak,
    lastCompletedAt: lastCompletedAt,
  );
}

void main() {
  late FakeStatsRepository statsRepository;
  late StatsProvider statsProvider;
  late MockKeyValueStorage storage;
  late MockAchievementsService achievementsService;
  late QuestProgressService service;

  void createService(Stats initialStats) {
    statsRepository = FakeStatsRepository(initialStats);
    statsProvider = StatsProvider(statsRepository, initialStats: initialStats);
    storage = MockKeyValueStorage();
    achievementsService = MockAchievementsService();
    service = QuestProgressService(
      statsProvider: statsProvider,
      storage: storage,
      achievementsService: achievementsService,
    );
  }

  setUpAll(() {
    registerFallbackValue(makeStats());
    registerFallbackValue(<IdKeys>{});
  });

  group('completeQuest', () {
    test('returns alreadyDoneToday and does not update stats when quest was completed today', () async {
      final now = DateTime.now();
      final initialStats = makeStats(
        streakDays: 3,
        totalQuestCompleted: 7,
        maxStreak: 5,
        lastCompletedAt: DateTime(now.year, now.month, now.day, 1),
      );
      createService(initialStats);

      final result = await service.completeQuest();

      expect(result.status, QuestCompletionStatus.alreadyDoneToday);
      expect(statsProvider.stats, initialStats);
      expect(statsRepository.storedStats, initialStats);
      verifyNever(() => achievementsService.loadUnlocked());
      verifyNever(
            () => achievementsService.checkAchievements(
          stats: any(named: 'stats'),
          currentUnlocked: any(named: 'currentUnlocked'),
        ),
      );
      verifyNever(() => achievementsService.saveUnlocked(any()));
    });

    test('starts a new streak, increments totals, and checks achievements', () async {
      final initialStats = makeStats(
        streakDays: 4,
        totalQuestCompleted: 9,
        maxStreak: 6,
        lastCompletedAt: DateTime.now().subtract(const Duration(days: 3)),
      );
      createService(initialStats);
      when(() => achievementsService.loadUnlocked()).thenAnswer(
            (_) async => {IdKeys.idFirstStepsAchievement},
      );
      when(
            () => achievementsService.checkAchievements(
          stats: any(named: 'stats'),
          currentUnlocked: any(named: 'currentUnlocked'),
        ),
      ).thenReturn({IdKeys.idServeTenTeasAchievement});
      when(
            () => achievementsService.saveUnlocked(any()),
      ).thenAnswer((_) async {});

      final result = await service.completeQuest();

      expect(result.status, QuestCompletionStatus.completed);
      expect(statsProvider.stats.streakDays, 1);
      expect(statsProvider.stats.totalQuestCompleted, 10);
      expect(statsProvider.stats.maxStreak, 6);
      expect(statsProvider.stats.lastCompletedAt, isNotNull);
      verify(() => achievementsService.loadUnlocked()).called(1);
      verify(
            () => achievementsService.checkAchievements(
          stats: statsProvider.stats,
          currentUnlocked: {IdKeys.idFirstStepsAchievement},
        ),
      ).called(1);
      verify(
            () => achievementsService.saveUnlocked({
          IdKeys.idFirstStepsAchievement,
          IdKeys.idServeTenTeasAchievement,
        }),
      ).called(1);
    });

    test('continues a consecutive-day streak and updates maxStreak', () async {
      final yesterday = DateTime.now().subtract(const Duration(days: 1));
      final initialStats = makeStats(
        streakDays: 6,
        totalQuestCompleted: 12,
        maxStreak: 6,
        lastCompletedAt: yesterday,
      );
      createService(initialStats);
      when(() => achievementsService.loadUnlocked()).thenAnswer((_) async => {});
      when(
            () => achievementsService.checkAchievements(
          stats: any(named: 'stats'),
          currentUnlocked: any(named: 'currentUnlocked'),
        ),
      ).thenReturn({});

      final result = await service.completeQuest();

      expect(result.status, QuestCompletionStatus.completed);
      expect(statsProvider.stats.streakDays, 7);
      expect(statsProvider.stats.totalQuestCompleted, 13);
      expect(statsProvider.stats.maxStreak, 7);
      verifyNever(() => achievementsService.saveUnlocked(any()));
    });
  });
}