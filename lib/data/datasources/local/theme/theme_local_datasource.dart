import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_datasource.dart';

final themeLocalDataSourcdeProvider =
    Provider<ThemeLocalDataSource>((ref) => ThemeLocalDataSource());

class ThemeLocalDataSource extends ThemeDataSource {
  ThemeLocalDataSource();

  static const String _keyThemeMode = 'theme_mode';

  @override
  Future<ThemeMode?> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return EnumToString.fromString(
        ThemeMode.values, prefs.getString(_keyThemeMode) ?? '');
  }

  @override
  Future<void> saveThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyThemeMode, EnumToString.convertToString(theme));
  }
}
