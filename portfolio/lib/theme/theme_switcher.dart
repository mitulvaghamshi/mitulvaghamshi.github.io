import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Controls the app's theme mode.
class ThemeSwitcher extends ChangeNotifier {
  ThemeMode mode = .system;

  Brightness get _brightness => PlatformDispatcher.instance.platformBrightness;

  // Toggles the theme mode between light and dark.
  void toggle() {
    mode = switch (mode) {
      .dark => .light,
      .light => .dark,
      .system => _brightness == .dark ? .light : .dark,
    };
    notifyListeners();
  }
}
