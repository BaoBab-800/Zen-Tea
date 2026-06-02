import 'package:zentea/data/teas/list_of_teas.dart';
import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

import 'package:zentea/services/tea_collection/i_tea_collection_service.dart';

import '../storage/i_key_value_storage.dart';

class TeaCollectionService extends ITeaCollectionService {
  static const _teasKey = 'teas_data';
  final IKeyValueStorage _storage;
  late final List<TeaModel> _teas;
  late final Future<void> _loadFuture;

  TeaCollectionService(this._storage) {
    _teas = _buildDefaultCollection();
    _loadFuture = _loadFromStorage();
  }

  @override
  List<TeaModel> get teas => List.unmodifiable(_teas);

  @override
  TeaModel? teaByType(TeaType type) {
    final index = _indexOfType(type);
    return index == -1 ? null : _teas[index];
  }

  @override
  bool isUnlocked(TeaType type) => teaByType(type)?.isUnlocked ?? false;

  @override
  int servedCount(TeaType type) => teaByType(type)?.timesServed ?? 0;

  @override
  Future<void> unlockTea(TeaModel tea) async {
    if (isUnlocked(tea.type)) return;
    await _updateTeaByType(tea.type, (current) => current.copyWith(isUnlocked: true));
  }

  @override
  Future<void> incrementServed(TeaModel tea) {
    return _updateTeaByType(
      tea.type,
      (current) => current.copyWith(timesServed: current.timesServed + 1),
    );
  }

  @override
  Future<void> setUnlocked(TeaModel tea, bool value) {
    return _updateTeaByType(tea.type, (current) => current.copyWith(isUnlocked: value));
  }

  @override
  Future<void> setServedCount(TeaModel tea, int value) {
    return _updateTeaByType(
      tea.type,
      (current) => current.copyWith(timesServed: value.clamp(0, 1 << 30)),
    );
  }

  @override
  Future<void> ensureLoaded() => _loadFuture;

  @override
  String dumpState() {
    final buffer = StringBuffer();

    buffer.writeln('=== TeaCollectionService STATE ===\n');

    buffer.writeln('--- IN MEMORY ---');

    for (final tea in _teas) {
      buffer.writeln(
        '${tea.type.name}: unlocked=${tea.isUnlocked}, served=${tea.timesServed}',
      );
    }

    buffer.writeln('\n--- STORAGE ---');
    buffer.writeln('\n=== END ===');

    return buffer.toString();
  }

  List<TeaModel> _buildDefaultCollection() => List<TeaModel>.from(listOfTeas);

  Future<void> _loadFromStorage() async {
    final storedData = await _storage.get<Map>(_teasKey);
    if (storedData == null) {
      notifyListeners();
      return;
    }

    for (var i = 0; i < _teas.length; i++) {
      final tea = _teas[i];
      final teaData = storedData[tea.type.name] as Map?;
      _teas[i] = tea.copyWith(
        isUnlocked: teaData?['isUnlocked'] ?? tea.isUnlocked,
        timesServed: teaData?['timesServed'] ?? 0,
      );
    }

    notifyListeners();
  }

  Future<void> _updateTeaByType(TeaType type, TeaModel Function(TeaModel current) updater) async {
    final index = _indexOfType(type);
    if (index == -1) return;
    _teas[index] = updater(_teas[index]);
    await _persist();
    notifyListeners();
  }

  int _indexOfType(TeaType type) => _teas.indexWhere((item) => item.type == type);

  @override
  int countryCounter(TeaCountries country) {
    int counter = 0;
    for(int i = 0; i < _teas.length; i++) {
      if (_teas[i].isUnlocked && _teas[i].country == country) {
        counter++;
      }
    }

    return counter;
  }

  Future<void> _persist() {
    final data = {
      for (final tea in _teas)
        tea.type.name: {'isUnlocked': tea.isUnlocked, 'timesServed': tea.timesServed},
    };
    return _storage.put(_teasKey, data);
  }
}