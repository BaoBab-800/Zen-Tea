import 'package:flutter/material.dart';

import 'app_color_scheme.dart';
import '../extensions/map_colors_x.dart';

class AppTheme {
  static ThemeData light(AppColorScheme colors) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: colors.primary,
      scaffoldBackgroundColor: colors.backgroundLight,

      colorScheme: ColorScheme.light(
        primary: colors.primary,
        surface: colors.surfaceLight,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: colors.primary,
        foregroundColor: Colors.white,
      ),

      extensions: [
        MapColorsX(
          countryBase: const Color(0xFF000000),
          countryActive: Colors.green[700]!,
        ),
      ],
    );
  }

  static ThemeData dark(AppColorScheme colors) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: colors.primary,
      scaffoldBackgroundColor: colors.backgroundDark,

      colorScheme: ColorScheme.dark(
        primary: colors.primary,
        surface: colors.surfaceDark,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: colors.surfaceDark,
        foregroundColor: Colors.white,
      ),

      extensions: [
        MapColorsX(
          countryBase: const Color(0xFF000000),
          countryActive: Colors.green[900]!,
        ),
      ],
    );
  }
}

extension ThemeContext on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}

Color lighten(Color color, double amount) {
  return Color.lerp(color, Colors.white, amount)!;
}