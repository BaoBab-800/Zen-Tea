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

  const Stats({
    required this.totalServed,
    required this.uniqueTeas,
    required this.streakDays,
    required this.currentTeaServed,
    required this.rareTeasObtained,
  });

  Stats copyWith({
    int? totalServed,
    int? uniqueTeas,
    int? streakDays,
    int? currentTeaServed,
    int? rareTeasObtained,
  }) {
    return Stats(
      totalServed: totalServed ?? this.totalServed,
      uniqueTeas: uniqueTeas ?? this.uniqueTeas,
      streakDays: streakDays ?? this.streakDays,
      currentTeaServed: currentTeaServed ?? this.currentTeaServed,
      rareTeasObtained: rareTeasObtained ?? this.rareTeasObtained,
    );
  }
}