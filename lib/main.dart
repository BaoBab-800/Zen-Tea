import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/zen_tea_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox('tea_collection');
  await Hive.openBox('today_tea');
  await Hive.openBox('quest_progress');

  runApp(const ZenTeaApp());
}
