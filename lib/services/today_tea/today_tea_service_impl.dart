import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'today_tea_service.dart';

class TodayTeaServiceImpl implements TodayTeaService {
  final Box _box = Hive.box('today_tea');

  @override
  Future<TeaModel> getTeaOfToday(List<TeaModel> teas) async {
    if (teas.isEmpty) {
      throw StateError('Tea list cannot be empty');
    }

    final today = _todayKey();

    final savedDate = _box.get('tea_date') as String?;
    final savedIndex = _box.get('tea_index') as int?;

    if (savedDate == today && savedIndex != null && savedIndex >= 0 && savedIndex < teas.length) {
      return teas[savedIndex];
    }

    final randomIndex = Random().nextInt(teas.length);

    await _box.put('tea_date', today);
    await _box.put('tea_index', randomIndex);

    return teas[randomIndex];
  }

  @override
  Future<bool> shouldCountServingForToday() async {
    final today = _todayKey();
    final servedDate = _box.get('served_date') as String?;

    if (servedDate == today) {
      return false;
    }

    await _box.put('served_date', today);
    return true;
  }

  @override
  TeaModel getWeightedRandomTea(List<TeaModel> teas) {
    final totalWeight = teas.fold<int>(
      0, (sum, tea) => sum + getWeight(tea.features),
    );

    final random = Random().nextInt(totalWeight);

    int current = 0;

    for (final tea in teas) {
      current += getWeight(tea.features);

      if (random < current) {
        return tea;
      }
    }

    return teas.last;
  }

  String _todayKey() {
    final now = DateTime.now();
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    return '${now.year}-$month-$day';
  }
}