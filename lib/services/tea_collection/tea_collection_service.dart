import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:zentea/data/teas/list_of_teas.dart';
import 'package:zentea/data/teas/tea_model.dart';

class TeaCollectionService extends ChangeNotifier {
  static const _teasKey = 'teas_data';

  final Box _box = Hive.box('tea_collection');
  late final List<TeaModel> _teas;

  TeaCollectionService() {
    final storedData = _box.get(_teasKey) as Map?;

    _teas = listOfTeas.map((tea) {
      final data = storedData?[tea.type.name];

      return tea.copyWith(
        isUnlocked: data?['isUnlocked'] ?? tea.isUnlocked,
        timesServed: data?['timesServed'] ?? 0,
      );
    }).toList();
  }

  List<TeaModel> get teas => List.unmodifiable(_teas);

  Future<void> unlockTea(TeaModel tea) async {
    final index = _teas.indexWhere((item) => item.type == tea.type);

    if (index == -1 || _teas[index].isUnlocked) return;

    _teas[index] = _teas[index].copyWith(isUnlocked: true);

    await _persist();
    notifyListeners();
  }

  Future<void> incrementServed(TeaModel tea) async {
    final index = _teas.indexWhere((item) => item.type == tea.type);

    if (index == -1) return;

    final current = _teas[index];

    _teas[index] = current.copyWith(
      timesServed: current.timesServed + 1,
    );

    await _persist();
    notifyListeners();
  }

  Future<void> _persist() async {
    final data = {
      for (final tea in _teas)
        tea.type.name: {
          'isUnlocked': tea.isUnlocked,
          'timesServed': tea.timesServed,
        }
    };

    await _box.put(_teasKey, data);
  }
}