import 'package:flutter/material.dart';
import 'package:portfolio/cards/about_card.dart';
import 'package:portfolio/cards/edu_card.dart';
import 'package:portfolio/cards/intro_card.dart';
import 'package:portfolio/cards/repo_card.dart';
import 'package:portfolio/cards/wes_card.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/widgets/frame.dart';

@immutable
class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  static const widgets = [
    IntroCard(),
    EduCard(),
    RepoCard(),
    WesCard(),
    AboutCard(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = AppScope.of(context).theme;
    return Scaffold(
      floatingActionButton: Frame.card(
        color: context.colors.themeButton,
        onTap: () => theme.change(Theme.of(context).brightness),
        child: Icon(
          switch (theme.mode) {
            ThemeMode.dark => Icons.light_mode,
            ThemeMode.light => Icons.dark_mode,
            ThemeMode.system => Icons.brightness_4,
          },
          color: const Color(0xffffffff),
          size: context.layout.data.dp * 1.5,
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverList.builder(
          itemCount: 5,
          itemBuilder: (_, index) => widgets[index],
        ),
      ]),
    );
  }
}
