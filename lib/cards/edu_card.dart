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
    final size = Size(
      context.width / (context.width >= 940 ? 2 : 1) - context.layout.dp * 1.5,
      context.layout.dp * 15,
    );
    final children = AppData.educationLinks.map((e) {
      return SizedBox.fromSize(size: size, child: _EduItem(college: e));
    });

    return Frame.container(
      color: context.colors.eduContainer,
      child: context.config.build(
        mobileSmall290: Column(children: children.toList()),
        laptopSmall940: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children.toList(),
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
    return Frame.link(
      url: college.url,
      color: context.colors.eduCard,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          college.year,
          style: TextStyle(
            color: context.colors.eduTitle,
            fontSize: context.layout.dp * 1.3,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.layout.dp / 2),
        Text(
          college.major,
          style: TextStyle(
            color: context.colors.eduSubtitle,
            fontSize: context.layout.dp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.layout.dp / 2),
        Text(
          college.name,
          style: TextStyle(
            color: context.colors.eduText,
            fontSize: context.layout.dp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.layout.dp / 2),
        Text(
          college.address,
          style: TextStyle(
            color: context.colors.eduText,
            fontSize: context.layout.dp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}
