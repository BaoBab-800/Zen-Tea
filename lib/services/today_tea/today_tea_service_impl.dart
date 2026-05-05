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
    final savedTeaTypeName = _box.get('tea_type') as String?;

    if (savedDate == today && savedTeaTypeName != null) {
      final savedTea = teas.where((tea) => tea.type.name == savedTeaTypeName).firstOrNull;
      if (savedTea != null) {
        return savedTea;
      }
    }

    final tea = getWeightedRandomTea(teas);

    await _box.put('tea_date', today);
    await _box.put('tea_type', tea.type.name);

    return tea;
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