import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/zen_tea_app.dart';
import 'data/stats/stats.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(StatsAdapter());
  }

  await Hive.openBox('settings');
  await Hive.openBox('tea_collection');
  await Hive.openBox('today_tea');
  await Hive.openBox('quest_progress');
  await Hive.openBox<List>('achievements');
  await Hive.openBox<Stats>('stats_box');

  runApp(const ZenTeaApp());
}