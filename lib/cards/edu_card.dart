import 'package:flutter/material.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/app_data.dart';

@immutable
class EduCard extends StatelessWidget {
  const EduCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Frame.container(
      color: context.colors.eduContainer,
      child: context.config.build(
        mobileSmall290: Column(
          children: AppData.educationLinks.map((e) {
            return SizedBox(width: context.width, child: _EduItem(college: e));
          }).toList(),
        ),
        tabletLarge760: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: AppData.educationLinks.map((e) {
            return SizedBox(
              width: context.width / 2 - 32,
              child: _EduItem(college: e),
            );
          }).toList(),
        ),
      ),
    );
  }
}

@immutable
class _EduItem extends StatelessWidget {
  const _EduItem({required this.college});

  final Cinq college;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.apply(
          bodyColor: context.colors.eduText,
          displayColor: context.colors.eduText,
        );
    return Frame.link(
      url: college.url,
      color: context.colors.eduCard,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          college.major,
          overflow: TextOverflow.ellipsis,
          style: theme.headlineSmall!.copyWith(color: context.colors.eduTitle),
        ),
        const SizedBox(height: 16),
        Text(
          college.name,
          style: theme.titleMedium!.copyWith(color: context.colors.eduSubtitle),
        ),
        const SizedBox(height: 8),
        Text(college.year, style: theme.bodyMedium),
        const SizedBox(height: 8),
        Text(college.address, style: theme.bodyMedium),
      ]),
    );
  }
}
