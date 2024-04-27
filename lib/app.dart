import 'package:flutter/material.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/state/app_state.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/widgets/home.dart';

@immutable
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key, required this.state});

  final AppState state;

  @override
  Widget build(BuildContext context) {
    return AppScope(
      data: state,
      child: AnimatedBuilder(
        animation: state.themeController,
        builder: (_, child) => MaterialApp(
          title: 'Portfolio App',
          theme: _lightThemeData,
          darkTheme: _darkThemeData,
          themeMode: state.themeController.themeMode,
          home: const Home(),
        ),
      ),
    );
  }
}

final _colors = AppColors();

final _lightThemeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  useMaterial3: true,
  extensions: [_colors.lightThemeExtension],
);

final _darkThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  extensions: [_colors.darkThemeExtension],
);
