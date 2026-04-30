import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import 'today_tea_service.dart';
import 'package:zentea/data/teas/tea_model.dart';

class TodayTeaServiceImpl implements TodayTeaService {
  final SharedPreferences prefs;

  TodayTeaServiceImpl(this.prefs);

  @override
  Future<TeaModel> getTeaOfToday(List<TeaModel> teas) async {
    final today = _todayKey();

    final savedDate = prefs.getString('tea_date');
    final savedIndex = prefs.getInt('tea_index');

    if (savedDate == today && savedIndex != null && savedIndex >= 0 && savedIndex < teas.length) {
      return teas[savedIndex];
    }

    final randomIndex = Random().nextInt(teas.length);

    await prefs.setString('tea_date', today);
    await prefs.setInt('tea_index', randomIndex);

    return teas[randomIndex];
  }

  String _todayKey() {
    final now = DateTime.now();
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    return '${now.year}-$month-$day';
  }
}