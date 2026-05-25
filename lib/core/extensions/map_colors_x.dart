import 'package:flutter/material.dart';

class MapColorsX extends ThemeExtension<MapColorsX>{
  final Color countryBase;
  final Color countryActive;

  const MapColorsX({
    required this.countryBase,
    required this.countryActive,
  });

  @override
  MapColorsX copyWith({
    Color? countryBase,
    Color? countryActive,
  }) {
    return MapColorsX(
      countryBase: countryBase ?? this.countryBase,
      countryActive: countryActive ?? this.countryActive,
    );
  }

  @override
  MapColorsX lerp(
      ThemeExtension<MapColorsX>? other,
      double t,
      ) {
    if (other is! MapColorsX) {
      return this;
    }

    return MapColorsX(
      countryBase: Color.lerp(countryBase, other.countryBase, t)!,
      countryActive: Color.lerp(countryActive, other.countryActive, t)!,
    );
  }
}

extension ThemeGetter on BuildContext {
  MapColorsX get mapColors => Theme.of(this).extension<MapColorsX>()!;
}