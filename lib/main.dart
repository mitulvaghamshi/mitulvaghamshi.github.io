import 'package:flutter/material.dart';
import 'package:portfolio/state/app_state.dart';
import 'package:portfolio/app.dart';

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
