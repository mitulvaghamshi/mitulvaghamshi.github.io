import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Controls the app's theme mode.
class ThemeController extends ChangeNotifier {
  ThemeMode themeMode = .system;

  Brightness get _brightness => PlatformDispatcher.instance.platformBrightness;

  // Toggles the theme mode between light and dark.
  void toggle() {
    themeMode = switch (themeMode) {
      .dark => .light,
      .light => .dark,
      .system => _brightness == .dark ? .light : .dark,
    };
    notifyListeners();
  }
}
