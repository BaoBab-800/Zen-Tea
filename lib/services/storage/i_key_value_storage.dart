abstract class IKeyValueStorage {
  Future<void> put<T>(String key, T value);
  Future<T?> get<T>(String key);
}