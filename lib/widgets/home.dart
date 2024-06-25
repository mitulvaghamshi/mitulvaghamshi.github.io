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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ThemeButton(),
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
