import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  Box<T> box<T>(String name) => Hive.box<T>(name);

  V getValue<V>({
    required String boxName,
    required String key,
    required V defaultValue,
  }) {
    final value = box<dynamic>(boxName).get(key);
    if (value is V) return value;
    return defaultValue;
  }

  V? getOptional<V>({
    required String boxName,
    required String key,
  }) {
    final value = box<dynamic>(boxName).get(key);
    return value is V ? value : null;
  }

  Future<void> putValue({
    required String boxName,
    required String key,
    required Object? value,
  }) {
    return box<dynamic>(boxName).put(key, value);
  }
}
