import 'package:flutter/material.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/colors_model.dart';
import 'package:portfolio/widgets/description_widget.dart';
import 'package:portfolio/widgets/empty_widget.dart';
import 'package:portfolio/widgets/name_widget.dart';
import 'package:portfolio/widgets/picture_widget.dart';
import 'package:portfolio/widgets/social_buttons.dart';

part 'intro_card.layouts.dart';

@immutable
class IntroCard extends StatelessWidget {
  const IntroCard({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const .only(top: 16),
    child: Frame.container(
      color: context.colors.introContainer,
      child: context.config.build(
        mobileSmall290: const _Widget290(),
        mobileLarge420: const _Widget420(),
        tabletMedium640: const _Widget640(),
        tabletLarge760: const _Widget760(),
        laptopSmall940: const _Widget940(),
      ),
    ),
  );
}
