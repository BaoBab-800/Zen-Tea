import 'package:flutter/material.dart';

import '../extensions/map_colors_x.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      surface: AppColors.surfaceLight,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),

    extensions: [
      MapColorsX(
        countryBase: Color(0xFF000000),
        countryActive: Colors.green[700]!,
      ),
    ],
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      surface: AppColors.surfaceDark,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      foregroundColor: Colors.white,
    ),

    extensions: [
      MapColorsX(
        countryBase: Color(0xFF000000),
        countryActive: Colors.green[900]!,
      ),
    ],
  );
}

extension ThemeContext on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}