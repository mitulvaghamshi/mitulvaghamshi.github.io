import 'package:flutter/material.dart';
import 'package:portfolio/state/app_state.dart';
import 'package:portfolio/utils/layout_config.dart';

// InheritedWidget to hold app state and make it accessible to the widget tree
@immutable
class AppScope extends InheritedWidget {
  const AppScope({super.key, required this.data, required super.child});

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
  // Get the width from the app state
  double get width => AppScope.of(this).width;

  // Get the layout config from the app state
  LayoutConfig get config => AppScope.of(this).layoutConfig;
}
