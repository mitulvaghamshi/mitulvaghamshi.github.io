import 'package:flutter/material.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/state/app_state.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/widgets/portfolio.dart';

@immutable
class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.state});

  final AppState state;

  @override
  Widget build(BuildContext context) {
    return AppScope(
      data: state,
      child: AnimatedBuilder(
        animation: state.theme,
        builder: (_, child) => MaterialApp(
          title: 'Portfolio App',
          theme: _lightTheme,
          darkTheme: _darkTheme,
          themeMode: state.theme.mode,
          home: const Portfolio(),
        ),
      ),
    );
  }
}

final _themes = AppColors();

final _lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  useMaterial3: true,
  extensions: [_themes.lightTheme],
);

final _darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  extensions: [_themes.darkTheme],
);
