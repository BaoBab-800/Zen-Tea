import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:zentea/services/storage/hive_key_value_storage.dart';

void main() {
  late Directory tempStorageDirectory;
  late Box<dynamic> box;
  late HiveKeyValueStorage storage;

  setUp(() async {
    tempStorageDirectory = await Directory.systemTemp.createTemp();

    Hive.init(tempStorageDirectory.path);

    box = await Hive.openBox('test_storage_box');
    storage = HiveKeyValueStorage(box);
  });
  
  tearDown(() async {
    await box.close();
    await tempStorageDirectory.delete(recursive: true);
  });

  group('HiveKeyValueStorage', () {
    test('stores value by key', () async {
      const key = 'name';
      const value = 'Ivan';

      await storage.put(key, value);
      
      expect(box.get(key), value);
    });

    test('returns stored value by key', () async {
      const key = 'name';
      const value = 'Nat';

      await storage.put(key, value);

      final result = await storage.get<String>(key);

      expect(result, value);
    });

    test('returns null when key does not exist', () async {
      const key = 'unknown';

      final value = await storage.get<String>(key);

      expect(value, isNull);
    });
  });
}