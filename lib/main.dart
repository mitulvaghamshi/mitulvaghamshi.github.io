import 'package:flutter/material.dart';
import 'package:layout_breakpoint/layout_breakpoint.dart';
import 'package:portfolio/state/app_state.dart';
import 'package:portfolio/widgets/app.dart';

void main() => runApp(const BaseApp());

@immutable
class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppState? state;
    return LayoutBuilder(builder: (_, constraints) {
      final width = constraints.biggest.width;
      if (state == null) {
        state = AppState.from(width: width);
      } else {
        if (state!.layout.data.contains(width)) {
          state = state!.copyWith(width: width);
        } else {
          state = state!.copyWith(width: width, layout: AppLayout.from(width));
        }
      }
      return MainApp(state: state!);
    });
  }
}
