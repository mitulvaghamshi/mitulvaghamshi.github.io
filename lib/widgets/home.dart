import 'package:flutter/material.dart';
import 'package:portfolio/cards/about_card.dart';
import 'package:portfolio/cards/edu_card.dart';
import 'package:portfolio/cards/intro_card.dart';
import 'package:portfolio/cards/repo_card.dart';
import 'package:portfolio/cards/wes_card.dart';
import 'package:portfolio/widgets/widgets.dart';

@immutable
class Home extends StatelessWidget {
  const Home({super.key});

  static const widgets = [
    IntroCard(),
    EduCard(),
    RepoCard(),
    WesCard(),
    AboutCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ThemeButton(),
      body: CustomScrollView(slivers: [
        SliverList.builder(
          itemCount: 5,
          itemBuilder: (_, index) => widgets[index],
        ),
      ]),
    );
  }
}
