import 'package:flutter/material.dart';
import 'package:portfolio/cards/about_card.dart';
import 'package:portfolio/cards/edu_card.dart';
import 'package:portfolio/cards/intro_card.dart';
import 'package:portfolio/cards/repo_card.dart';
import 'package:portfolio/cards/wes_card.dart';
import 'package:portfolio/cards/work_card.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/widgets/frame_factory.dart';

@immutable
class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  static const _cards = [
    IntroCard.new,
    EduCard.new,
    WorkCard.new,
    RepoCard.new,
    WesCard.new,
    AboutCard.new,
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButton: const _ThemeButton(),
    body: ListView.builder(
      itemCount: _cards.length,
      itemBuilder: (_, index) => _cards[index](),
    ),
  );
}

@immutable
class _ThemeButton extends StatelessWidget {
  const _ThemeButton();

  @override
  Widget build(BuildContext context) {
    final theme = AppScope.of(context).themeSwitcher;
    return FrameFactory.card(
      onTap: theme.toggle,
      color: context.colors.themeButton,
      child: Icon(switch (theme.mode) {
        .dark => Icons.light_mode,
        .light => Icons.dark_mode,
        .system => Icons.brightness_4,
      }, color: const Color(0xffffffff)),
    );
  }
}
