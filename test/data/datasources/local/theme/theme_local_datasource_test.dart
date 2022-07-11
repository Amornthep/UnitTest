import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/data/datasources/local/theme/theme_local_datasource.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({'theme_mode': 'dark'});
  });

  test('should load theme mode successfully', () async {
    final container = ProviderContainer();
    final themeLocalDataSource = container.read(themeLocalDataSourcdeProvider);

    final themeMode = await themeLocalDataSource.loadThemeMode();

    expect(themeMode, ThemeMode.dark);
  });

  test('should save theme mode successfully', () async {
    final container = ProviderContainer();
    final themeLocalDataSource = container.read(themeLocalDataSourcdeProvider);

    await themeLocalDataSource.saveThemeMode(ThemeMode.light);

    final themeMode = await themeLocalDataSource.loadThemeMode();

    expect(themeMode, ThemeMode.light);
  });
}
