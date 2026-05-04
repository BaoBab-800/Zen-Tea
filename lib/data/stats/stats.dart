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

  const Stats({
    required this.totalServed,
    required this.uniqueTeas,
    required this.streakDays,
    required this.currentTeaServed,
  });
}