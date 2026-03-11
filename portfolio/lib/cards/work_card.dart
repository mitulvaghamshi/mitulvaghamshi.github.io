import 'package:flutter/material.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/breakpoint.dart';
import 'package:portfolio/utils/static_data.dart';
import 'package:portfolio/widgets/frame_factory.dart';

@immutable
class WorkCard extends StatefulWidget {
  const WorkCard({super.key});

  @override
  State<WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
  bool _isMinimized = false;

  @override
  Widget build(BuildContext context) => FrameFactory.controls(
    title: 'Work Experience',
    titleColor: context.colors.workTitle,
    color: context.colors.workContainer,
    isMinimized: _isMinimized,
    onMinimize: () => setState(() => _isMinimized = !_isMinimized),
    child: context.breakpoint.build(
      smallMobile: const _CardCountWidget(count: 1),
      largeTablet: const _CardCountWidget(count: 2),
      smallLaptop: const _CardCountWidget(count: 3),
    ),
  );
}

@immutable
class _CardCountWidget extends StatelessWidget {
  const _CardCountWidget({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) => Wrap(
    alignment: .center,
    runAlignment: .center,
    children: StaticData.workExprLinks.map((item) {
      return SizedBox(
        width: (context.width - 64) / count,
        height: context.width > 420 ? 200 : 220,
        child: _ExpItem(experience: item),
      );
    }).toList(),
  );
}

@immutable
class _ExpItem extends StatelessWidget {
  const _ExpItem({required this.experience});

  final ExpPair experience;

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context).apply(
      bodyColor: context.colors.workText,
      displayColor: context.colors.workText,
    );
    return FrameFactory.link(
      url: experience.url,
      color: context.colors.workCard,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            experience.position,
            maxLines: 1,
            overflow: .ellipsis,
            style: theme.headlineSmall!.copyWith(
              color: context.colors.workTitle,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            experience.name,
            maxLines: 1,
            overflow: .ellipsis,
            style: theme.titleMedium!.copyWith(
              color: context.colors.workSubtitle,
            ),
          ),
          const SizedBox(height: 8),
          Text(experience.duration, style: theme.bodyMedium),
          const SizedBox(height: 8),
          Text(experience.location, style: theme.bodyMedium),
        ],
      ),
    );
  }
}
