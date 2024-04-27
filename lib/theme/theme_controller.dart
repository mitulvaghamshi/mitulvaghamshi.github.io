import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemeController._();

  static final _instance = ThemeController._();
  static ThemeController get instance => _instance;

  ThemeMode themeMode = ThemeMode.system;

  void change(final Brightness brightness) {
    themeMode = switch (themeMode) {
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.system => brightness == Brightness.dark //
          ? ThemeMode.light
          : ThemeMode.dark,
    };
    notifyListeners();
  }
}
