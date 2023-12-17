import 'package:flutter/material.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/app_data.dart';
import 'package:portfolio/widgets/frame.dart';

@immutable
class WesCard extends StatelessWidget {
  const WesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Frame.container(
      color: context.colors.wesContainer,
      child: context.layout.build(
        mobileSmall290: const Wrap(
          alignment: WrapAlignment.center,
          children: [WesLogo(), WesContent()],
        ),
      ),
    );
  }
}

@immutable
class WesLogo extends StatelessWidget {
  const WesLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.layout.data;
    final width = context.width < 860 ? 250 : layout.dp * 11;
    return Frame.card(
      animate: true,
      color: context.colors.wesCard,
      child: Image.asset(
        'assets/wes.webp',
        cacheWidth: width.toInt(),
        frameBuilder: (p1, child, frame, p4) =>
            frame == null ? SizedBox(width: width.toDouble()) : child,
      ),
    );
  }
}

@immutable
class WesContent extends StatelessWidget {
  const WesContent({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout.data;
    final style = TextStyle(
      color: colors.wesText,
      fontSize: layout.dp,
      fontWeight: FontWeight.bold,
    );
    return Frame.card(
      color: colors.wesCard,
      child: Column(children: [
        Text(
          'Verified International Academic Qualifications',
          textAlign: TextAlign.center,
          style: style.copyWith(fontSize: layout.dp * 1.5),
        ),
        Frame.link(
          url: AppData.wesBadgeUrl,
          color: colors.wesTitle,
          child: Text('See badge @(credly.com)', style: style),
        ),
        Frame.link(
          url: AppData.wesReportUrl,
          color: colors.wesTitle,
          child: Text('See evaluation @(wes.org)', style: style),
        ),
      ]),
    );
  }
}
