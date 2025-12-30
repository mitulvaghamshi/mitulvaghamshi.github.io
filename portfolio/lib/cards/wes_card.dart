import 'package:flutter/material.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/colors_model.dart';
import 'package:portfolio/utils/app_content.dart';

@immutable
class WesCard extends StatefulWidget {
  const WesCard({super.key});

  @override
  State<WesCard> createState() => _WesCardState();
}

class _WesCardState extends State<WesCard> {
  bool isMinimized = false;

  @override
  Widget build(BuildContext context) => Frame.controls(
    title: 'Credentials',
    titleColor: context.colors.wesText,
    color: context.colors.wesContainer,
    isMinimized: isMinimized,
    onMinimize: () => setState(() => isMinimized = !isMinimized),
    child: context.config.build(
      mobileSmall290: const Wrap(
        alignment: .center,
        children: [_WesLogo(), _WesContent()],
      ),
    ),
  );
}

@immutable
class _WesLogo extends StatelessWidget {
  const _WesLogo();

  @override
  Widget build(BuildContext context) => Frame.card(
    animate: true,
    color: context.colors.wesCard,
    child: Image.asset(
      'assets/wes.webp',
      cacheWidth: 200,
      frameBuilder: (_, child, frame, _) =>
          frame == null ? const SizedBox(width: 200) : child,
    ),
  );
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
      child: Column(
        children: [
          Text(
            'Verified International Academic Qualifications',
            style: theme.headlineMedium,
            textAlign: .center,
          ),
          const SizedBox(height: 16),
          Frame.link(
            url: AppContent.wesBadgeUrl,
            color: context.colors.wesTitle,
            child: Text('See badge @(credly.com)', style: theme.titleMedium),
          ),
          Frame.link(
            url: AppContent.wesReportUrl,
            color: context.colors.wesTitle,
            child: Text('See evaluation @(wes.org)', style: theme.titleMedium),
          ),
        ],
      ),
    );
  }
}
