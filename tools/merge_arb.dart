import 'dart:io';

import 'arb_file_model.dart';

void main() {
  final directory = Directory('lib/l10n');
  final files = findArbFiles(directory);
  final group = groupByLanguage(files);

  if (files.isEmpty) {
    print('No ARB files found.');
    return;
  }

  for (final file in files) {
    print(file.language);
  }

  for (final file in group.entries) {
    print(file);
  }
}

List<ArbFileModel> findArbFiles(Directory directory) {
  if (!directory.existsSync()) {
    return [];
  }

  return directory
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.toLowerCase().endsWith('.arb'))
      .map(
        (file) => ArbFileModel(
      file: file,
      language: getLanguage(file),
      module: getModule(file),
    ),
  ).toList();
}

String getLanguage(File file) {
  final fileName = file.uri.pathSegments.last;
  return fileName.substring(0, fileName.length - '.arb'.length);
}

String getModule(File file) {
  return file.parent.uri.pathSegments.last;
}

Map<String, List<ArbFileModel>> groupByLanguage(List<ArbFileModel> files) {
  final result = <String, List<ArbFileModel>>{};

  for (final file in files) {
    result.putIfAbsent(file.language, () => []).add(file);
  }

  return result;
}