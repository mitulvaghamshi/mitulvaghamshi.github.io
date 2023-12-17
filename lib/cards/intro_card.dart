import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/app_data.dart';
import 'package:url_launcher/link.dart';

part 'intro_card.layouts.dart';
part 'intro_card.widgets.dart';

@immutable
class IntroCard extends StatelessWidget {
  const IntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.layout.dp / 2),
      child: Frame.container(
        color: context.colors.introContainer,
        child: context.config.build(
          mobileSmall290: const _Widget290(),
          tabletMedium640: const _Widget640(),
          tabletLarge760: const _Widget760(),
          laptopSmall940: const _Widget940(),
        ),
      ),
    );
  }
}
