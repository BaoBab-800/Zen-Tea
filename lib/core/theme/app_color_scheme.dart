import 'package:flutter/material.dart';

class AppColorScheme {
  final Color primary;
  final Color belowPrimary;

  final Color backgroundLight;
  final Color backgroundDark;

  final Color surfaceLight;
  final Color surfaceDark;

  const AppColorScheme({
    required this.primary,
    required this.belowPrimary,
    required this.backgroundLight,
    required this.backgroundDark,
    required this.surfaceLight,
    required this.surfaceDark,
  });
}