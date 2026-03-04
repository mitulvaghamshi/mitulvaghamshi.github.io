import 'package:flutter/material.dart';
import 'package:portfolio/github/github_controller.dart';
import 'package:portfolio/theme/theme_controller.dart';
import 'package:portfolio/utils/layout_config.dart';

@immutable
class AppState {
  const AppState({
    required this.width,
    required this.layoutConfig,
    required this.themeController,
    required this.githubController,
  });

  AppState.init()
    : width = 0,
      layoutConfig = .mobileTiny,
      themeController = .new(),
      githubController = .new()..fetchAsync();

  // The width of the screen.
  final double width;

  // The configuration for the layout.
  final LayoutConfig layoutConfig;

  // The controller for the application's theme.
  final ThemeController themeController;

  // The service for interacting with the GitHub API.
  final GitHubController githubController;
}

extension Utils on AppState {
  AppState update(double width) => layoutConfig.canHold(width)
      ? copyWith(width: width)
      : copyWith(width: width, layoutConfig: .from(width));

  AppState copyWith({
    double? width,
    LayoutConfig? layoutConfig,
    ThemeController? themeController,
    GitHubController? githubController,
  }) => .new(
    width: width ?? this.width,
    layoutConfig: layoutConfig ?? this.layoutConfig,
    themeController: themeController ?? this.themeController,
    githubController: githubController ?? this.githubController,
  );
}
