import 'package:flutter/material.dart';
import 'package:portfolio/github/github_handler.dart';
import 'package:portfolio/theme/theme_switcher.dart';
import 'package:portfolio/utils/breakpoint.dart';

@immutable
class AppState {
  const AppState({
    required this.width,
    required this.breakpoint,
    required this.themeSwitcher,
    required this.githubController,
  });

  AppState.init()
    : width = 0,
      breakpoint = .deviceX,
      themeSwitcher = .new(),
      githubController = .new()..fetchAsync();

  // The width of the screen.
  final double width;

  // The configuration for the layout.
  final Breakpoint breakpoint;

  // The controller for the application's theme.
  final ThemeSwitcher themeSwitcher;

  // The service for interacting with the GitHub API.
  final GitHubHandler githubController;
}

extension Utils on AppState {
  AppState update(double width) => breakpoint.canHold(width)
      ? copyWith(width: width)
      : copyWith(width: width, breakpoint: .from(width));

  AppState copyWith({
    double? width,
    Breakpoint? breakpoint,
    ThemeSwitcher? themeSwitcher,
    GitHubHandler? githubController,
  }) => .new(
    width: width ?? this.width,
    breakpoint: breakpoint ?? this.breakpoint,
    themeSwitcher: themeSwitcher ?? this.themeSwitcher,
    githubController: githubController ?? this.githubController,
  );
}
