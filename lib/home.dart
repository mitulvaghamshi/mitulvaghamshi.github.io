import 'package:flutter/material.dart';
import 'package:portfolio/cards/about_card.dart';
import 'package:portfolio/cards/edu_card.dart';
import 'package:portfolio/cards/intro_card.dart';
import 'package:portfolio/cards/repo_card.dart';
import 'package:portfolio/cards/wes_card.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';

@immutable
class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      IntroCard.new,
      EduCard.new,
      RepoCard.new,
      WesCard.new,
      if (context.width < 1440) AboutCard.new,
    ];
    return Scaffold(
      floatingActionButton: const _ThemeButton(),
      body: ListView.builder(
        itemCount: cards.length,
        itemBuilder: (_, index) => cards[index](),
      ),
    );
  }
}

@immutable
class _ThemeButton extends StatelessWidget {
  const _ThemeButton();

  @override
  Widget build(BuildContext context) {
    final ctrl = AppScope.of(context).themeController;
    return Frame.card(
      onTap: ctrl.toggleTheme,
      color: context.colors.themeButton,
      child: Icon(
        switch (ctrl.themeMode.value) {
          ThemeMode.dark => Icons.light_mode,
          ThemeMode.light => Icons.dark_mode,
          ThemeMode.system => Icons.brightness_4,
        },
        color: const Color(0xffffffff),
      ),
    );
  }
}
