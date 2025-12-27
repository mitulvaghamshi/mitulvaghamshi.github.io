import 'package:flutter/material.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/theme/colors_model.dart';
import 'package:portfolio/utils/app_content.dart';
import 'package:portfolio/widgets/traffic_lights.dart';

@immutable
class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

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
          const TrafficLights(title: 'about.txt'),
          const SizedBox(height: 16),
          Text(AppContent.introText, style: style.bodyMedium),
        ],
      ),
    );
  }
}
