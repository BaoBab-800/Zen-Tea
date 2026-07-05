import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/zen_tea_app.dart';

import 'data/stats/stats.dart';
import 'data/profile/profile_stats.dart';

import 'services/stats/hive_stats_repository.dart';
import 'services/profile/profile_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter('zentea');
  Hive.registerAdapter(StatsAdapter());
  Hive.registerAdapter(ProfileStatsAdapter());

  await Hive.openBox<Stats>('stats_box');
  await Hive.openBox<ProfileStats>('profile_box');
  await Hive.openBox('app_storage');

  final statsBox = Hive.box<Stats>('stats_box');
  final profileBox = Hive.box<ProfileStats>('profile_box');

  final statsRepository = HiveStatsRepository(statsBox);
  final profileStatsRepository = ProfileRepository(profileBox, statsRepository);

  final initialStats = await statsRepository.getStats();
  final initialProfile = await profileStatsRepository.getProfileStats();

  runApp(
    ZenTeaApp(
      statsRepository: statsRepository,
      initialStats: initialStats,
      profileStatsRepository: profileStatsRepository,
      initialProfile: initialProfile,
    ),
  );
}