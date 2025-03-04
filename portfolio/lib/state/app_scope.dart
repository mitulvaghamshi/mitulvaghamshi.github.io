import 'package:flutter/material.dart';
import 'package:layout_breakpoint/layout_breakpoint.dart';
import 'package:portfolio/state/app_state.dart';

// InheritedWidget to hold app state and make it accessible to the widget tree
@immutable
class AppScope extends InheritedWidget {
  const AppScope({super.key, required this.data, required super.child});

  // App state data
  final AppState data;

  // Access the app state from a BuildContext
  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    return ArgumentError.checkNotNull(scope).data;
  }

  // Update should notify if the width of the app state changes
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      oldWidget is AppScope && data.width != oldWidget.data.width;
}

// Extension on BuildContext to provide easy access to app state properties
extension Utils on BuildContext {
  // Get the layout config from the app state
  LayoutConfig get config => AppScope.of(this).layoutConfig;

  // Get the layout data from the app state
  LayoutData get layout => AppScope.of(this).layoutConfig.data;

  // Get the width from the app state
  double get width => AppScope.of(this).width;
}
