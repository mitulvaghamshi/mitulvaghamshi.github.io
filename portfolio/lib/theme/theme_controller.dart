import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Controls the app's theme mode.
interface class ThemeController {
  // Current theme mode of the app.
  final themeMode = ValueNotifier(ThemeMode.system);

  // Toggles the theme mode between light and dark.
  void toggleTheme() => themeMode.value = switch (themeMode.value) {
    ThemeMode.dark => ThemeMode.light,
    ThemeMode.light => ThemeMode.dark,
    ThemeMode.system =>
      PlatformDispatcher.instance.platformBrightness == Brightness.dark
          ? ThemeMode.light
          : ThemeMode.dark,
  };
}
