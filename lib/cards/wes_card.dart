import 'package:flutter/material.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/app_data.dart';

@immutable
class WesCard extends StatelessWidget {
  const WesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Frame.container(
      color: context.colors.wesContainer,
      child: context.config.build(
        mobileSmall290: const Wrap(
          alignment: WrapAlignment.center,
          children: [_WesLogo(), _WesContent()],
        ),
      ),
    );
  }
}

@immutable
class _WesLogo extends StatelessWidget {
  const _WesLogo();

  @override
  Widget build(BuildContext context) {
    final width = context.width < 860 ? 250 : context.layout.dp * 11;

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
class _WesContent extends StatelessWidget {
  const _WesContent();

  @override
  Widget build(BuildContext context) {
    return Frame.card(
      color: context.colors.wesCard,
      child: Column(children: [
        Text(
          'Verified International Academic Qualifications',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: context.colors.wesText,
            fontSize: context.layout.dp * 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        Frame.link(
          url: AppData.wesBadgeUrl,
          color: context.colors.wesTitle,
          child: Text(
            'See badge @(credly.com)',
            style: TextStyle(
              color: context.colors.wesText,
              fontSize: context.layout.dp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Frame.link(
          url: AppData.wesReportUrl,
          color: context.colors.wesTitle,
          child: Text(
            'See evaluation @(wes.org)',
            style: TextStyle(
              color: context.colors.wesText,
              fontSize: context.layout.dp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
