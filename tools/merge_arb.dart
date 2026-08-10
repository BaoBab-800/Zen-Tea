import 'dart:io';
import 'dart:convert';

import 'arb_file_model.dart';

void main() {
  final sourceDirectory = Directory('lib/l10n/source');

  final files = findArbFiles(sourceDirectory);

  if (files.isEmpty) {
    print('No ARB files found.');
    return;
  }

  final groups = groupByLanguage(files);

  final generatedDirectory = Directory('lib/l10n/generated');

  if (!generatedDirectory.existsSync()) {
    generatedDirectory.createSync(recursive: true);
  }

  final translations = <String, Map<String, dynamic>>{};

  for (final entry in groups.entries) {
    translations[entry.key] = mergeArbFiles(entry.value);
  }

  validateLanguages(translations);

  for (final entry in translations.entries) {
    writeArbFile(
      entry.value,
      generatedDirectory,
      entry.key,
    );
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

Map<String, dynamic> readArbFile(ArbFileModel arbFile) {
  try {
    final content = arbFile.file.readAsStringSync();

    return jsonDecode(content) as Map<String, dynamic>;
  } on FormatException catch (e) {
    throw FormatException(
      'Invalid JSON in ${arbFile.file.path}: ${e.message}',
    );
  }
}

Map<String, dynamic> mergeArbFiles(List<ArbFileModel> files) {
  final result = <String, dynamic>{};

  for (final file in files) {
    final data = readArbFile(file);

    for (final entry in data.entries) {
      if (result.containsKey(entry.key)) {
        throw Exception(
          'Duplicate key "${entry.key}" '
              'in ${file.file.path}',
        );
      }

      result[entry.key] = entry.value;
    }
  }

  return result;
}

void writeArbFile(
    Map<String, dynamic> data,
    Directory directory,
    String language,
    ) {
  final file = File('${directory.path}/app_$language.arb');

  final content = const JsonEncoder.withIndent('  ').convert(data);

  file.writeAsStringSync(content);
}

void validateLanguages(Map<String, Map<String, dynamic>> translations) {
  const baseLanguage = 'en';

  if (!translations.containsKey(baseLanguage)) {
    throw Exception('Base language "$baseLanguage" not found.');
  }

  final baseKeys = translations[baseLanguage]!.keys.toSet();
  final errors = <String>[];

  for (final entry in translations.entries) {
    final language = entry.key;

    if (language == baseLanguage) {
      continue;
    }

    final keys = entry.value.keys.toSet();
    final missing = baseKeys.difference(keys);
    final extra = keys.difference(baseKeys);

    if (missing.isNotEmpty) {
      errors.add(
        '[$language] Missing keys (${missing.length}): '
            '${missing.join(', ')}',
      );
    }

    if (extra.isNotEmpty) {
      errors.add(
        '[$language] Extra keys (${extra.length}): '
            '${extra.join(', ')}',
      );
    }
  }

  if (errors.isNotEmpty) {
    print('--- Localization Validation Errors ---');

    for (final error in errors) {
      print(error);
    }

    throw Exception(
      'Localization validation failed. Found issues in translations.',
    );
  }

  print('All localizations are valid and match "$baseLanguage" keys.');
}