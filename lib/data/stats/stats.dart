import 'package:hive/hive.dart';

part 'stats.g.dart';

@HiveType(typeId: 0)
class Stats {
  @HiveField(0)
  final int totalServed;

  @HiveField(1)
  final int uniqueTeas;

  @HiveField(2)
  final int streakDays;

  @HiveField(3)
  final int currentTeaServed;

  @HiveField(4)
  final int rareTeasObtained;

  @HiveField(5)
  final int legendaryTeasObtained;

  @HiveField(6)
  final int totalQuestCompleted;

  @HiveField(7)
  final int maxStreak;

  @HiveField(8)
  final DateTime? lastCompletedAt;

  const Stats({
    required this.totalServed,
    required this.uniqueTeas,
    required this.streakDays,
    required this.currentTeaServed,
    required this.rareTeasObtained,
    required this.legendaryTeasObtained,
    required this.totalQuestCompleted,
    required this.maxStreak,
    this.lastCompletedAt,
  });

  Stats copyWith({
    int? totalServed,
    int? uniqueTeas,
    int? streakDays,
    int? currentTeaServed,
    int? rareTeasObtained,
    int? legendaryTeasObtained,
    int? totalQuestCompleted,
    int? maxStreak,
    DateTime? lastCompletedAt,
  }) {
    return Stats(
      totalServed: totalServed ?? this.totalServed,
      uniqueTeas: uniqueTeas ?? this.uniqueTeas,
      streakDays: streakDays ?? this.streakDays,
      currentTeaServed: currentTeaServed ?? this.currentTeaServed,
      rareTeasObtained: rareTeasObtained ?? this.rareTeasObtained,
      legendaryTeasObtained: legendaryTeasObtained ?? this.legendaryTeasObtained,
      totalQuestCompleted: totalQuestCompleted ?? this.totalQuestCompleted,
      maxStreak: maxStreak ?? this.maxStreak,
      lastCompletedAt: lastCompletedAt ?? this.lastCompletedAt,
    );
  }
}