import 'package:flutter/material.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/theme/colors_model.dart';
import 'package:portfolio/widgets/traffic_lights.dart';

@immutable
class NameWidget extends StatelessWidget {
  const NameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.apply(
      bodyColor: context.colors.introText,
      displayColor: context.colors.introText,
    );
    return Frame.card(
      color: context.colors.introCard,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const TrafficLights(title: 'name.txt'),
          Text.rich(
            TextSpan(
              text: 'Software Developer',
              style: style.titleSmall!.copyWith(fontWeight: .bold),
              children: [
                TextSpan(
                  text: '_\n',
                  style: style.headlineMedium!.copyWith(
                    color: context.colors.themeButton,
                  ),
                ),
                TextSpan(
                  text: 'Mitul Vaghamshi',
                  style: style.headlineLarge!.copyWith(fontWeight: .bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
