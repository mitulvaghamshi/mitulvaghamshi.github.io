import 'package:flutter/material.dart';
import 'package:portfolio/state/app_state.dart';
import 'package:portfolio/utils/layout_config.dart';

@immutable
class AppScope extends InheritedWidget {
  const AppScope({super.key, required this.data, required super.child});

  final AppState data;

  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    return ArgumentError.checkNotNull(scope).data;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) =>
      oldWidget is AppScope && data.width != oldWidget.data.width;
}

extension Utils on BuildContext {
  double get width => AppScope.of(this).width;

  LayoutConfig get config => AppScope.of(this).layoutConfig;
}
