import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/external/local_storage/preference_local_storage.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({
      'key': 'value',
      'list_key': ['value1', 'value2']
    });
  });

  test('should get value successfully', () async {
    final container = ProviderContainer();
    final localStorage = container.read(preferenceLocalStorageProvider);

    final value = await localStorage.getString('key');

    expect(value, 'value');
  });

  test('should save value successfully', () async {
    final container = ProviderContainer();
    final localDataSource = container.read(preferenceLocalStorageProvider);

    await localDataSource.setString(key: 'key', value: 'value2');

    final value = await localDataSource.getString('key');

    expect(value, 'value2');
  });

  test('should get list value successfully', () async {
    final container = ProviderContainer();
    final localDataSource = container.read(preferenceLocalStorageProvider);

    final value = await localDataSource.getListString('list_key');

    expect(value, ['value1', 'value2']);
  });

  test('should save list value successfully', () async {
    final container = ProviderContainer();
    final localDataSource = container.read(preferenceLocalStorageProvider);

    await localDataSource.setListString(key: 'list_key', value: ['value3']);

    final value = await localDataSource.getListString('list_key');

    expect(value, ['value3']);
  });

  test('should remove successfully', () async {
    final container = ProviderContainer();
    final localDataSource = container.read(preferenceLocalStorageProvider);

    await localDataSource.remove('key');

    final value = await localDataSource.getString('key');

    expect(value, isNull);
  });

  test('should get null value successfully', () async {
    final container = ProviderContainer();
    final localDataSource = container.read(preferenceLocalStorageProvider);

    final value = await localDataSource.getString('key2');

    expect(value, isNull);
  });
}
