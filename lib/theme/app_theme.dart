import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  AppTheme._();

  static final _instance = AppTheme._();
  static AppTheme get instance => _instance;

  ThemeMode mode = ThemeMode.system;

  void change(final Brightness brightness) {
    mode = switch (mode) {
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.system => brightness == Brightness.dark //
          ? ThemeMode.light
          : ThemeMode.dark,
    };
    notifyListeners();
  }
}
