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

  TeaModel copyWith({
    TeaType? type,
    String? imagePath,
    bool? isUnlocked,
  }) {
    return TeaModel(
      type: type ?? this.type,
      imagePath: imagePath ?? this.imagePath,
      isUnlocked: isUnlocked ?? this.isUnlocked,
    );
  }
}