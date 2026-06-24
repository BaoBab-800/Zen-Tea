import 'dart:math';

import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'package:zentea/services/storage/i_key_value_storage.dart';

import 'i_today_tea_service.dart';

class TodayTeaServiceImpl implements ITodayTeaService {
  static const _servedDateKey = 'served_date';
  static const _teaDateKey = 'tea_date';
  static const _teaTypeKey = 'tea_type';

  final IKeyValueStorage _storage;

  TodayTeaServiceImpl(this._storage);

  @override
  Future<TeaModel> getTeaOfToday(List<TeaModel> teas) async {
    if (teas.isEmpty) throw StateError('Tea list cannot be empty');

    final savedTea = await _loadSavedTea(teas);
    if (savedTea != null) return savedTea;

    final tea = getWeightedRandomTea(teas);
    await _saveTeaOfToday(tea.type.name);
    return tea;
  }

  @override
  Future<bool> shouldCountServingForToday() async {
    final today = _todayKey();
    final servedDate = await _storage.get<String>(_servedDateKey);
    if (servedDate == today) return false;
    await _storage.put(_servedDateKey, today);
    return true;
  }

  @override
  Future<void> debugAdvanceToNextDay() async {
    final yesterday = _dateKey(
      DateTime.now().subtract(const Duration(days: 1)),
    );
    await _storage.put(_servedDateKey, yesterday);
    await _storage.put(_teaDateKey, yesterday);
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

  Future<TeaModel?> _loadSavedTea(List<TeaModel> teas) async {
    final today = _todayKey();
    final savedDate = await _storage.get<String>(_teaDateKey);
    final savedTeaType = await _storage.get<String>(_teaTypeKey);
    if (savedDate != today || savedTeaType == null) return null;
    return teas.where((tea) => tea.type.name == savedTeaType).firstOrNull;
  }

  Future<void> _saveTeaOfToday(String teaTypeName) async {
    final today = _todayKey();
    await _storage.put(_teaDateKey, today);
    await _storage.put(_teaTypeKey, teaTypeName);
  }

  String _todayKey() => _dateKey(DateTime.now());

  String _dateKey(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }
}