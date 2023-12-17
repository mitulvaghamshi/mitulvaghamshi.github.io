import 'package:flutter/material.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/app_data.dart';
import 'package:portfolio/widgets/frame.dart';

@immutable
class EduCard extends StatelessWidget {
  const EduCard({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.layout.data;
    final width = context.width;
    final size =
        Size(width / (width >= 940 ? 2 : 1) - layout.dp * 1.5, layout.dp * 15);
    final children = AppData.educationLinks
        .map((e) => SizedBox.fromSize(size: size, child: EduItem(college: e)))
        .toList();
    return Frame.container(
      color: context.colors.eduContainer,
      child: context.layout.build(
        mobileSmall290: Column(children: children),
        laptopSmall940: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}

@immutable
class EduItem extends StatelessWidget {
  const EduItem({super.key, required this.college});

  final Cinq college;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout.data;
    final space = SizedBox(height: layout.dp / 2);
    final style = TextStyle(
      fontSize: layout.dp,
      fontWeight: FontWeight.bold,
    );
    return Frame.link(
      url: college.url,
      color: colors.eduCard,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            college.year,
            style: style.copyWith(
              color: colors.eduTitle,
              fontSize: layout.dp * 1.5,
            ),
          ),
          space,
          Text(
            college.major,
            style: style.copyWith(color: colors.eduSubtitle),
          ),
          space,
          Text(
            college.name,
            style: style.copyWith(color: colors.eduText),
          ),
          space,
          Text(
            college.address,
            style: style.copyWith(color: colors.eduText),
          ),
        ],
      ),
    );
  }
}
