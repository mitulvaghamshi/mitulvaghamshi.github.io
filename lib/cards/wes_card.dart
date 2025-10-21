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
    return Frame.card(
      animate: true,
      color: context.colors.wesCard,
      child: Image.asset(
        'assets/wes.webp',
        cacheWidth: 200,
        frameBuilder: (_, child, frame, __) => frame == null //
            ? const SizedBox(width: 200)
            : child,
      ),
    );
  }
}

@immutable
class _WesContent extends StatelessWidget {
  const _WesContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.apply(
          bodyColor: context.colors.wesText,
          displayColor: context.colors.wesText,
        );
    return Frame.card(
      color: context.colors.wesCard,
      child: Column(children: [
        Text(
          'Verified International Academic Qualifications',
          textAlign: TextAlign.center,
          style: theme.headlineMedium,
        ),
        const SizedBox(height: 16),
        Frame.link(
          url: AppData.wesBadgeUrl,
          color: context.colors.wesTitle,
          child: Text('See badge @(credly.com)', style: theme.titleMedium),
        ),
        Frame.link(
          url: AppData.wesReportUrl,
          color: context.colors.wesTitle,
          child: Text('See evaluation @(wes.org)', style: theme.titleMedium),
        ),
      ]),
    );
  }
}
