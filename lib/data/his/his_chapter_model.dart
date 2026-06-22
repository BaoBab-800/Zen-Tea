import 'package:flutter/material.dart';

class HisChapterModel {
  final int id;
  final List<String> content;
  final IconData icon;
  final bool hasUnknownSymbolsError;

  HisChapterModel({
    required this.id,
    required this.content,
    required this.icon,
    this.hasUnknownSymbolsError = false,
  });
}