import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zentea/data/teas/list_of_teas.dart';
import 'package:zentea/data/teas/tea_model.dart';

class TeaCollectionService extends ChangeNotifier {
  static const _unlockedTeasKey = 'unlocked_tea_types';

  final SharedPreferences _prefs;
  late final List<TeaModel> _teas;

  TeaCollectionService(this._prefs) {
    final unlockedTeaTypes = _prefs.getStringList(_unlockedTeasKey) ??
        listOfTeas
            .where((tea) => tea.isUnlocked)
            .map((tea) => tea.type.name)
            .toList();

    _teas = listOfTeas.map(
          (tea) => tea.copyWith(
        isUnlocked: unlockedTeaTypes.contains(tea.type.name),
      ),
    ).toList();

    _persistUnlockedTeas();
  }

  List<TeaModel> get teas => List.unmodifiable(_teas);

  Future<void> unlockTea(TeaModel tea) async {
    final index = _teas.indexWhere((item) => item.type == tea.type);

    if (index == -1 || _teas[index].isUnlocked) {
      return;
    }

    _teas[index] = _teas[index].copyWith(isUnlocked: true);
    await _persistUnlockedTeas();
    notifyListeners();
  }

  Future<void> _persistUnlockedTeas() async {
    final unlockedTeaTypes = _teas
        .where((tea) => tea.isUnlocked)
        .map((tea) => tea.type.name)
        .toList();

    await _prefs.setStringList(_unlockedTeasKey, unlockedTeaTypes);
  }
}