import 'package:flutter/material.dart';
import 'package:layout_breakpoint/layout_breakpoint.dart';
import 'package:portfolio/github/github_api.dart';
import 'package:portfolio/theme/theme_controller.dart';

@immutable
class AppState {
  const AppState({
    required this.width,
    required this.themeController,
    required this.githubApiService,
    required this.layoutConfig,
  });

  AppState.create({required this.width})
      : themeController = ThemeController.instance,
        githubApiService = GitHubApiService.instance..fetchAsync(),
        layoutConfig = LayoutConfig.from(width);

  final double width;
  final ThemeController themeController;
  final GitHubApiService githubApiService;
  final LayoutConfig layoutConfig;

  AppState update(final double width) =>
      layoutConfig.data.isWithin(width) ? setWidth(width) : setConfigFor(width);

  AppState setWidth(final double width) => copyWith(width: width);

  AppState setConfigFor(final double width) {
    return copyWith(
      width: width,
      layoutConfig: LayoutConfig.from(width),
    );
  }

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
