import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/zen_tea_app.dart';
import 'data/stats/stats.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(StatsAdapter());

  await Hive.openBox<Stats>('stats_box');
  await Hive.openBox('app_storage');

  runApp(const ZenTeaApp());
}