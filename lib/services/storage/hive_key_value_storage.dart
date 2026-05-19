import 'package:hive/hive.dart';

import 'i_key_value_storage.dart';

class HiveKeyValueStorage implements IKeyValueStorage {
  final Box<dynamic> _box;

  HiveKeyValueStorage(this._box);

  @override
  Future<void> put<T>(String key, T value) async {
    await _box.put(key, value);
  }

  @override
  Future<T?> get<T>(String key) async {
    return _box.get(key) as T?;
  }
}