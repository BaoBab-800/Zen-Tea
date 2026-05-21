import 'package:flutter/foundation.dart';

import 'package:zentea/data/teas/tea_model.dart';
import 'package:zentea/data/teas/tea_types.dart';

abstract class ITeaCollectionService extends ChangeNotifier {
  List<TeaModel> get teas;

  TeaModel? teaByType(TeaType type);
  bool isUnlocked(TeaType type);
  int servedCount(TeaType type);

  Future<void> unlockTea(TeaModel tea);
  Future<void> incrementServed(TeaModel tea);
  Future<void> setUnlocked(TeaModel tea, bool value);
  Future<void> setServedCount(TeaModel tea, int value);

  bool hasSeenDialog();
  Future<void> setDialogSeen();

  int countryCounter(TeaCountries country);
  String dumpState();
}