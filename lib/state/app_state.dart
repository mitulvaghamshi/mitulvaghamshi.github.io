import 'package:flutter/material.dart';
import 'package:layout_breakpoint/layout_breakpoint.dart';
import 'package:portfolio/github/github_api.dart';
import 'package:portfolio/theme/theme_controller.dart';

// Immutable application state.
@immutable
class AppState {
  // Constructor for the AppState class.
  const AppState({
    required this.width,
    required this.themeController,
    required this.githubApiService,
    required this.layoutConfig,
  });

  // Factory constructor to create an AppState instance.
  AppState.create({required this.width})
      : themeController = ThemeController.instance,
        githubApiService = GitHubApiService.instance..fetchAsync(),
        layoutConfig = LayoutConfig.from(width);

  // The width of the screen.
  final double width;
  // The controller for the application's theme.
  final ThemeController themeController;
  // The service for interacting with the GitHub API.
  final GitHubApiService githubApiService;
  // The configuration for the layout.
  final LayoutConfig layoutConfig;

  // Updates the app state based on the new width.
  AppState update(final double width) =>
      layoutConfig.data.isWithin(width) ? setWidth(width) : setConfigFor(width);

  // Sets the width of the app state.
  AppState setWidth(final double width) => copyWith(width: width);

  // Sets the layout configuration for the app state based on the new width.
  AppState setConfigFor(final double width) {
    return copyWith(
      width: width,
      layoutConfig: LayoutConfig.from(width),
    );
  }

  // Creates a copy of the app state with the given parameters.
  AppState copyWith({
    final double? width,
    final ThemeController? themeController,
    final GitHubApiService? githubApiService,
    final LayoutConfig? layoutConfig,
  }) {
    return AppState(
      width: width ?? this.width,
      themeController: themeController ?? this.themeController,
      githubApiService: githubApiService ?? this.githubApiService,
      layoutConfig: layoutConfig ?? this.layoutConfig,
    );
  }
}
