import 'package:flutter/material.dart';
import 'package:portfolio/home.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/state/app_state.dart';
import 'package:portfolio/theme/app_colors.dart';

void main() => runApp(const App());

@immutable
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AppState? state;
    return LayoutBuilder(builder: (_, constraints) {
      final width = constraints.biggest.width;
      state = state == null //
          ? AppState.create(width: width)
          : state!.update(width);
      return PortfolioApp(state: state!);
    });
  }
}

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
