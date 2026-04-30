import 'tea_types.dart';

class TeaModel {
  final TeaType type;
  final String imagePath;
  final bool isUnlocked;

  TeaModel({
    required this.type,
    required this.imagePath,
    this.isUnlocked = false,
  });
}