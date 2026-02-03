import 'package:flutter/material.dart';
import 'package:portfolio/home.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/state/app_state.dart';
import 'package:portfolio/theme/colors_model.dart';

void main() => runApp(const MainApp());

@immutable
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => PortfolioApp(state: .init());
}

@immutable
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key, required this.state});

  final AppState state;

  @override
  Widget build(BuildContext context) => AppScope(
    data: state.update(MediaQuery.sizeOf(context).width),
    child: AnimatedBuilder(
      animation: state.themeController,
      builder: (context, child) => MaterialApp(
        title: 'Portfolio App',
        theme: _lightThemeData,
        darkTheme: _darkThemeData,
        themeMode: state.themeController.themeMode,
        home: const HomeWidget(),
      ),
    ),
  );
}

const _colors = ColorsModel();

final _lightThemeData = ThemeData(
  colorScheme: .fromSeed(seedColor: Colors.white),
  useMaterial3: true,
  extensions: [_colors.lightThemeExtension],
);

final _darkThemeData = ThemeData(
  useMaterial3: true,
  brightness: .dark,
  extensions: [_colors.darkThemeExtension],
);
