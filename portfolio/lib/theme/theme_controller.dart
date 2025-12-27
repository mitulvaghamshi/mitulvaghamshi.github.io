import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Controls the app's theme mode.
class ThemeController {
  final themeMode = ValueNotifier<ThemeMode>(.system);

  Brightness get brightness => PlatformDispatcher.instance.platformBrightness;

  // Toggles the theme mode between light and dark.
  void toggle() => themeMode.value = switch (themeMode.value) {
    .dark => .light,
    .light => .dark,
    .system => brightness == .dark ? .light : .dark,
  };
}
