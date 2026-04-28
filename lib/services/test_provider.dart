import 'package:flutter/material.dart';

class TeaProvider extends ChangeNotifier {
  String currentTea = "Green Tea";

  void changeTea(String tea) {
    currentTea = tea;
    notifyListeners();
  }
}