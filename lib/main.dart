import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/zen_tea_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferences.getInstance();
  await Hive.initFlutter();
  await Hive.openBox('settings');

  final prefs = await SharedPreferences.getInstance();

  runApp(ZenTeaApp(prefs: prefs));
}
