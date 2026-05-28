import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/zen_tea_app.dart';
import 'data/stats/stats.dart';
import 'services/stats/hive_stats_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(StatsAdapter());

  await Hive.openBox<Stats>('stats_box');
  await Hive.openBox('app_storage');

  final statsBox = Hive.box<Stats>('stats_box');
  final statsRepository = HiveStatsRepository(statsBox);

  final initialStats = await statsRepository.getStats();

  runApp(
    ZenTeaApp(
      statsRepository: statsRepository,
      initialStats: initialStats,
    ),
  );
}