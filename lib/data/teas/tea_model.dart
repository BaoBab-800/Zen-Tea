import 'tea_types.dart';

class TeaModel {
  final TeaType type;
  final String imagePath;
  final String storyKey;
  final TeaFeatures features;
  final Uri url;
  final int timesServed;
  final bool isUnlocked;

  TeaModel({
    required this.type,
    required this.imagePath,
    required this.storyKey,
    required this.features,
    required this.url,
    required this.timesServed,
    this.isUnlocked = false,
  });

  TeaModel copyWith({
    TeaType? type,
    String? imagePath,
    String? story,
    TeaFeatures? features,
    Uri? url,
    int? timesServed,
    bool? isUnlocked,
  }) {
    return TeaModel(
      type: type ?? this.type,
      imagePath: imagePath ?? this.imagePath,
      storyKey: storyKey,
      features: features ?? this.features,
      url: url ?? this.url,
      timesServed: timesServed ?? this.timesServed,
      isUnlocked: isUnlocked ?? this.isUnlocked,
    );
  }
}