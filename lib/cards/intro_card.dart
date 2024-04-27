import 'package:flutter/material.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/widgets/frame.dart';
import 'package:portfolio/widgets/widgets.dart';

@immutable
class IntroCard extends StatelessWidget {
  const IntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.layout.data.dp / 2),
      child: Frame.container(
        color: context.colors.introContainer,
        child: context.layout.build(
          mobileSmall290: const _Widget290(),
          tabletMedium640: const _Widget640(),
          tabletLarge760: const _Widget760(),
          laptopSmall940: const _Widget940(),
        ),
      ),
    );
  }
}

@immutable
class _Widget940 extends StatelessWidget {
  const _Widget940();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfilePicture(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [FullName(), Description(), SocialButtonBar()],
          ),
        ),
      ],
    );
  }
}

@immutable
class _Widget760 extends StatelessWidget {
  const _Widget760();

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfilePicture(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [FullName(), Description()],
            ),
          ),
        ],
      ),
      SocialButtonBar(),
    ]);
  }
}

@immutable
class _Widget640 extends StatelessWidget {
  const _Widget640();

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [ProfilePicture(), FullName()]),
          Expanded(child: Description()),
        ],
      ),
      SocialButtonBar(),
    ]);
  }
}

@immutable
class _Widget290 extends StatelessWidget {
  const _Widget290();

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      ProfilePicture(),
      FullName(),
      Description(),
      SocialButtonBar(),
    ]);
  }
}
