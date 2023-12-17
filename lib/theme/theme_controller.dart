import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Controls the app's theme mode.
class ThemeController extends ChangeNotifier {
  ThemeController._();

  /// Singleton instance of the theme controller.
  static final _instance = ThemeController._();
  static ThemeController get instance => _instance;

  /// Current theme mode of the app.
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  /// Toggles the theme mode between light and dark.
  void toggleTheme() {
    _themeMode = switch (_themeMode) {
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.system =>
        PlatformDispatcher.instance.platformBrightness == Brightness.dark
            ? ThemeMode.light
            : ThemeMode.dark,
    };
    notifyListeners();
  }
}
