import 'package:flutter/foundation.dart';

import 'package:zentea/data/teas/list_of_teas.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';
import 'package:zentea/services/hive/hive_service.dart';

class TeaCollectionService extends ChangeNotifier {
  static const _boxName = 'tea_collection';
  static const _teasKey = 'teas_data';
  static const _hasSeenDialogKey = 'has_seen_dialog';

  final HiveService _hive;
  late final List<TeaModel> _teas;

  TeaCollectionService(this._hive) {
    _teas = _buildCollection();
  }

  List<TeaModel> get teas => List.unmodifiable(_teas);

  TeaModel? teaByType(TeaType type) {
    final index = _indexOfType(type);
    return index == -1 ? null : _teas[index];
  }

  bool isUnlocked(TeaType type) => teaByType(type)?.isUnlocked ?? false;
  int servedCount(TeaType type) => teaByType(type)?.timesServed ?? 0;

  Future<void> unlockTea(TeaModel tea) async {
    if (isUnlocked(tea.type)) return;
    await _updateTeaByType(tea.type, (current) => current.copyWith(isUnlocked: true));
  }

  Future<void> incrementServed(TeaModel tea) {
    return _updateTeaByType(
      tea.type,
      (current) => current.copyWith(timesServed: current.timesServed + 1),
    );
  }

  Future<void> setUnlocked(TeaModel tea, bool value) {
    return _updateTeaByType(tea.type, (current) => current.copyWith(isUnlocked: value));
  }

  Future<void> setServedCount(TeaModel tea, int value) {
    return _updateTeaByType(
      tea.type,
      (current) => current.copyWith(timesServed: value.clamp(0, 1 << 30)),
    );
  }

  bool hasSeenDialog() {
    return _hive.getValue<bool>(
      boxName: _boxName,
      key: _hasSeenDialogKey,
      defaultValue: false,
    );
  }

  String dumpState() {
    final buffer = StringBuffer();

    buffer.writeln('=== TeaCollectionService STATE ===\n');

    buffer.writeln('--- IN MEMORY ---');

    for (final tea in _teas) {
      buffer.writeln(
        '${tea.type.name}: unlocked=${tea.isUnlocked}, served=${tea.timesServed}',
      );
    }

    buffer.writeln('\n--- RAW HIVE DATA ---');

    final raw = _hive.getOptional<Map>(boxName: _boxName, key: _teasKey);

    if (raw == null) {
      buffer.writeln('No data in Hive');
    } else {
      raw.forEach((key, value) => buffer.writeln('$key => $value'));
    }

    buffer.writeln('\n=== END ===');

    return buffer.toString();
  }

  Future<void> setDialogSeen() {
    return _hive.putValue(boxName: _boxName, key: _hasSeenDialogKey, value: true);
  }

  List<TeaModel> _buildCollection() {
    final storedData = _hive.getOptional<Map>(boxName: _boxName, key: _teasKey);

    return listOfTeas.map((tea) {
      final teaData = storedData?[tea.type.name] as Map?;
      return tea.copyWith(
        isUnlocked: teaData?['isUnlocked'] ?? tea.isUnlocked,
        timesServed: teaData?['timesServed'] ?? 0,
      );
    }).toList();
  }

  Future<void> _updateTeaByType(TeaType type, TeaModel Function(TeaModel current) updater) async {
    final index = _indexOfType(type);
    if (index == -1) return;
    _teas[index] = updater(_teas[index]);
    await _persist();
    notifyListeners();
  }

  int _indexOfType(TeaType type) => _teas.indexWhere((item) => item.type == type);

  Future<void> _persist() {
    final data = {
      for (final tea in _teas)
        tea.type.name: {'isUnlocked': tea.isUnlocked, 'timesServed': tea.timesServed},
    };
    return _hive.putValue(boxName: _boxName, key: _teasKey, value: data);
  }
}