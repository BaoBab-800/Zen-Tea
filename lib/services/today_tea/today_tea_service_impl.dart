import 'dart:math';

import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';
import 'package:zentea/services/hive/hive_service.dart';

import 'today_tea_service.dart';

class TodayTeaServiceImpl implements TodayTeaService {
  static const _boxName = 'today_tea';

  final HiveService _hive;

  TodayTeaServiceImpl(this._hive);

  @override
  Future<TeaModel> getTeaOfToday(List<TeaModel> teas) async {
    if (teas.isEmpty) throw StateError('Tea list cannot be empty');

    final savedTea = _loadSavedTea(teas);
    if (savedTea != null) return savedTea;

    final tea = getWeightedRandomTea(teas);
    await _saveTeaOfToday(tea.type.name);
    return tea;
  }

  @override
  Future<bool> shouldCountServingForToday() async {
    final today = _todayKey();
    final servedDate = _hive.getOptional<String>(boxName: _boxName, key: 'served_date');
    if (servedDate == today) return false;
    await _hive.putValue(boxName: _boxName, key: 'served_date', value: today);
    return true;
  }

  @override
  TeaModel getWeightedRandomTea(List<TeaModel> teas) {
    final totalWeight = teas.fold<int>(0, (sum, tea) => sum + getWeight(tea.features));
    final random = Random().nextInt(totalWeight);

    var current = 0;
    for (final tea in teas) {
      current += getWeight(tea.features);
      if (random < current) return tea;
    }

    return teas.last;
  }

  TeaModel? _loadSavedTea(List<TeaModel> teas) {
    final today = _todayKey();
    final savedDate = _hive.getOptional<String>(boxName: _boxName, key: 'tea_date');
    final savedTeaType = _hive.getOptional<String>(boxName: _boxName, key: 'tea_type');
    if (savedDate != today || savedTeaType == null) return null;
    return teas.where((tea) => tea.type.name == savedTeaType).firstOrNull;
  }

  Future<void> _saveTeaOfToday(String teaTypeName) async {
    final today = _todayKey();
    await _hive.putValue(boxName: _boxName, key: 'tea_date', value: today);
    await _hive.putValue(boxName: _boxName, key: 'tea_type', value: teaTypeName);
  }

  String _todayKey() {
    final now = DateTime.now();
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    return '${now.year}-$month-$day';
  }
}
