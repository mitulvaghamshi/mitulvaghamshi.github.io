import 'package:flutter/material.dart';
import 'package:layout_breakpoint/layout_breakpoint.dart';
import 'package:portfolio/state/app_state.dart';

@immutable
class AppScope extends InheritedWidget {
  const AppScope({super.key, required this.data, required super.child});

  final AppState data;

  static AppState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppScope>()!.data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      oldWidget is AppScope ? data.width != oldWidget.data.width : false;
}

extension Extensions on BuildContext {
  AppLayout get layout => AppScope.of(this).layout;
  double get width => AppScope.of(this).width;
}
