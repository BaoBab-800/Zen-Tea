import 'dart:io';

class ArbFileModel {
  final File file;
  final String language;
  final String module;

  const ArbFileModel({
    required this.file,
    required this.language,
    required this.module,
  });
}