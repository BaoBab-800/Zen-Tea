import 'dart:convert';
import 'dart:io';

void main() {
  final directory = Directory('lib/l10n/source');

  final files = directory
      .listSync()
      .whereType<File>()
      .where((file) => file.path.endsWith('_en.arb'));

  final result = <String, dynamic>{};

  for (final file in files) {
    final content = jsonDecode(file.readAsStringSync());

    result.addAll(content);
  }

  File('lib/l10n/app_en.arb').writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert(result),
  );
}