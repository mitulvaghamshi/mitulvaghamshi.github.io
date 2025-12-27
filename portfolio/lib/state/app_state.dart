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

  // Factory constructor to create an AppState instance.
  AppState.create({required this.width})
    : layoutConfig = .from(width),
      themeController = ThemeController(),
      githubController = GitHubController()..fetchAsync();

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
  // Updates the app state based on the new width.
  AppState update(double width) => layoutConfig.canHold(width)
      ? copyWith(width: width)
      : copyWith(width: width, layoutConfig: .from(width));

  // Creates a copy of the app state with the given parameters.
  AppState copyWith({
    double? width,
    LayoutConfig? layoutConfig,
    ThemeController? themeController,
    GitHubController? githubController,
  }) => AppState(
    width: width ?? this.width,
    layoutConfig: layoutConfig ?? this.layoutConfig,
    themeController: themeController ?? this.themeController,
    githubController: githubController ?? this.githubController,
  );
}
