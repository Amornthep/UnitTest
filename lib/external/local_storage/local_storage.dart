abstract class LocalStorage {
  Future<List<String>?> getListString(String key);

  Future<String?> getString(String key);

  Future<void> setString({
    required String key,
    required String value,
  });

  Future<void> setListString({
    required String key,
    required List<String> value,
  });

  Future<void> remove(String key);
}
