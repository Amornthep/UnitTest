import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repositories/theme_repository.dart';
import '../../domain/repositories/theme_repositiry.dart';

final appThemeNotifierProvider = ChangeNotifierProvider<AppTheme>(
    (ref) => AppTheme(ref.read(themeRepositoryProvider)));

const primaryColor = Color(0xff6772e5);
const accentColor = Color(0xff6772e5);
const errorColor = Color(0xffe65f75);
const backgroundColor = Color(0xfff2f2f7);
const blue = Color(0xff87bbfe);
const red = Color(0xffe65f75);
const coral = Color(0xfffa7268);
const orange = Color(0xffff9153);
const yellow = Color.fromARGB(255, 255, 183, 97);
const pink = Color(0xfff69cd3);
const green = Color(0xff65d26e);
const purple = Color(0xff9260e4);
const brown = Color(0xffbca686);

ThemeData get lightTheme {
  return ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      error: errorColor,
      surface: Colors.white,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    errorColor: errorColor,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: backgroundColor,
    toggleableActiveColor: primaryColor,
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black87),
        ),
    iconTheme: ThemeData.light().iconTheme.copyWith(
          color: Colors.black87,
        ),
    floatingActionButtonTheme:
        ThemeData.light().floatingActionButtonTheme.copyWith(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
    listTileTheme: ThemeData.light().listTileTheme.copyWith(
          tileColor: ThemeData.light().scaffoldBackgroundColor,
        ),
    dividerTheme: ThemeData.light().dividerTheme.copyWith(
          color: Colors.grey,
        ),
    toggleButtonsTheme: ThemeData.light().toggleButtonsTheme.copyWith(
          selectedColor: primaryColor,
          selectedBorderColor: primaryColor,
          fillColor: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
  );
}

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      error: errorColor,
      surface: Colors.grey.shade800,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    errorColor: errorColor,
    backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
    toggleableActiveColor: primaryColor,
    listTileTheme: ThemeData.dark().listTileTheme.copyWith(
          tileColor: ThemeData.dark().scaffoldBackgroundColor,
        ),
    appBarTheme: ThemeData.dark().appBarTheme.copyWith(
          elevation: 0.0,
          backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        ),
    iconTheme: ThemeData.dark().iconTheme.copyWith(
          color: Colors.white,
        ),
    floatingActionButtonTheme:
        ThemeData.dark().floatingActionButtonTheme.copyWith(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
            ),
    dividerTheme: ThemeData.dark().dividerTheme.copyWith(
          color: Colors.grey,
        ),
    toggleButtonsTheme: ThemeData.light().toggleButtonsTheme.copyWith(
          selectedColor: primaryColor,
          selectedBorderColor: primaryColor,
          fillColor: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
  );
}

class AppTheme extends ChangeNotifier {
  AppTheme(this._repository);

  static const _defaultThemeMode = ThemeMode.light;

  final ThemeRepository _repository;

  ThemeMode _setting = _defaultThemeMode;

  ThemeMode get setting => _setting;

  Future<ThemeMode> themeMode() async {
    _setting = await _repository.loadThemeMode() ?? _defaultThemeMode;
    return _setting;
  }

  Future<void> _loadLightMode() async {
    _setting = ThemeMode.light;
    await _repository.saveThemeMode(_setting).whenComplete(notifyListeners);
  }

  Future<void> _loadDarkMode() async {
    _setting = ThemeMode.dark;
    await _repository.saveThemeMode(_setting).whenComplete(notifyListeners);
  }

  Future<void> toggle() async {
    setting == ThemeMode.light ? await _loadDarkMode() : await _loadLightMode();
  }
}
