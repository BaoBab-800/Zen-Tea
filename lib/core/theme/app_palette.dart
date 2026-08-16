import 'package:flutter/material.dart';
import 'app_color_scheme.dart';

enum AppPaletteType {
  orange,
  green,
}

class AppPalette {
  static const orange = AppColorScheme(
    primary: Color(0xFFDB7E33),
    belowPrimary: Color(0xFFBA5B1E),

    backgroundLight: Color(0xFFF5F5DC),
    backgroundDark: Color(0xFF1E1E1E),

    surfaceLight: Colors.white,
    surfaceDark: Color(0xFF2C2C2C),
  );

  static const green = AppColorScheme(
    primary: Color(0xFF6C9E4A),
    belowPrimary: Color(0xFF4E7C12),

    backgroundLight: Color(0xFFF5F5DC),
    backgroundDark: Color(0xFF1E1E1E),

    surfaceLight: Colors.white,
    surfaceDark: Color(0xFF2C2C2C),
  );

  static AppColorScheme get(AppPaletteType type) {
    return switch (type) {
      AppPaletteType.orange => orange,
      AppPaletteType.green => green,
    };
  }
}