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
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _ThemeButton(),
      body: CustomScrollView(slivers: [
        SliverList.list(children: const [
          IntroCard(),
          EduCard(),
          RepoCard(),
          WesCard(),
          AboutCard(),
        ]),
      ]),
    );
  }
}

@immutable
class _ThemeButton extends StatelessWidget {
  const _ThemeButton();

  @override
  Widget build(BuildContext context) {
    final controller = AppScope.of(context).themeController;

    return Frame.card(
      onTap: controller.toggleTheme,
      color: context.colors.themeButton,
      child: Icon(
        switch (controller.themeMode) {
          ThemeMode.dark => Icons.light_mode,
          ThemeMode.light => Icons.dark_mode,
          ThemeMode.system => Icons.brightness_4,
        },
        color: const Color(0xffffffff),
        size: context.layout.dp * 1.5,
      ),
    );
  }
}
