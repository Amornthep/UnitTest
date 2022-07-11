import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/data/datasources/local/theme/theme_local_datasource.dart';

import '../../domain/repositories/theme_repositiry.dart';
import '../datasources/local/theme/theme_datasource.dart';

final themeRepositoryProvider = Provider<ThemeRepository>(
    (ref) => ThemeRepositoryImpl(ref.read(themeLocalDataSourcdeProvider)));

class ThemeRepositoryImpl extends ThemeRepository {
  final ThemeDataSource _themeDataSource;

  ThemeRepositoryImpl(this._themeDataSource);

  @override
  Future<ThemeMode?> loadThemeMode() {
    return _themeDataSource.loadThemeMode();
  }

  @override
  Future<void> saveThemeMode(ThemeMode theme) {
    return _themeDataSource.saveThemeMode(theme);
  }
}
