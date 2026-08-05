import 'tea_types.dart';

class TeaModel {
  final TeaType type;
  final String imagePath;
  final TeaFeatures features;
  final TeaCountries country;
  final Uri url;
  final int timesServed;
  final bool isUnlocked;

  const TeaModel({
    required this.type,
    required this.imagePath,
    required this.features,
    required this.country,
    required this.url,
    required this.timesServed,
    this.isUnlocked = false,
  });

  TeaModel copyWith({
    TeaType? type,
    String? imagePath,
    TeaFeatures? features,
    TeaCountries? country,
    Uri? url,
    int? timesServed,
    bool? isUnlocked,
  }) {
    return TeaModel(
      type: type ?? this.type,
      imagePath: imagePath ?? this.imagePath,
      features: features ?? this.features,
      country: country ?? this.country,
      url: url ?? this.url,
      timesServed: timesServed ?? this.timesServed,
      isUnlocked: isUnlocked ?? this.isUnlocked,
    );
  }
}