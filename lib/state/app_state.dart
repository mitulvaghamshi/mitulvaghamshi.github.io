import 'package:flutter/material.dart';
import 'package:layout_breakpoint/layout_breakpoint.dart';
import 'package:portfolio/github/github_api.dart';
import 'package:portfolio/theme/app_theme.dart';

@immutable
class AppState {
  const AppState({
    required this.width,
    required this.theme,
    required this.github,
    required this.layout,
  });

  AppState.from({required this.width})
      : theme = AppTheme.instance,
        github = GitHubApi.instance..fetchAsync(),
        layout = AppLayout.from(width);

  final double width;
  final AppTheme theme;
  final GitHubApi github;
  final AppLayout layout;

  AppState copyWith({
    final double? width,
    final AppTheme? theme,
    final GitHubApi? github,
    final AppLayout? layout,
  }) {
    return AppState(
      width: width ?? this.width,
      theme: theme ?? this.theme,
      github: github ?? this.github,
      layout: layout ?? this.layout,
    );
  }
}
