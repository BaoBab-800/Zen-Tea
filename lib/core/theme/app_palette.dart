import 'package:flutter/material.dart';
import 'app_color_scheme.dart';

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
    primary: Color(0xFF6C8E33),
    belowPrimary: Color(0xFF4A6C10),

    backgroundLight: Color(0xFFF5F5DC),
    backgroundDark: Color(0xFF1E1E1E),

    surfaceLight: Colors.white,
    surfaceDark: Color(0xFF2C2C2C),
  );
}