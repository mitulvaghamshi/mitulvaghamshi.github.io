import 'package:flutter/material.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/breakpoint.dart';
import 'package:portfolio/utils/static_data.dart';
import 'package:portfolio/widgets/frame_factory.dart';

@immutable
class WesCard extends StatefulWidget {
  const WesCard({super.key});

  @override
  State<WesCard> createState() => _WesCardState();
}

class _WesCardState extends State<WesCard> {
  bool _isMinimized = false;

  @override
  Widget build(BuildContext context) => FrameFactory.controls(
    title: 'Credentials',
    titleColor: context.colors.wesText,
    color: context.colors.wesContainer,
    isMinimized: _isMinimized,
    onMinimize: () => setState(() => _isMinimized = !_isMinimized),
    child: context.breakpoint.build(
      smallMobile: const Wrap(
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
  Widget build(BuildContext context) => FrameFactory.card(
    animate: true,
    color: context.colors.wesCard,
    child: Image.asset(
      StaticData.imgWesSrc,
      cacheWidth: 200,
      frameBuilder: (_, child, frame, _) {
        return frame == null ? const SizedBox(width: 200) : child;
      },
    ),
  );
}

@immutable
class _WesContent extends StatelessWidget {
  const _WesContent();

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context).apply(
      bodyColor: context.colors.wesText,
      displayColor: context.colors.wesText,
    );
    return FrameFactory.card(
      color: context.colors.wesCard,
      child: Column(
        children: [
          Text(
            'Verified International Academic Qualifications',
            style: theme.headlineMedium,
            textAlign: .center,
          ),
          const SizedBox(height: 16),
          FrameFactory.link(
            url: StaticData.wesBadgeUrl,
            color: context.colors.wesTitle,
            child: Text('See badge @(credly.com)', style: theme.titleMedium),
          ),
          FrameFactory.link(
            url: StaticData.wesReportUrl,
            color: context.colors.wesTitle,
            child: Text('See evaluation @(wes.org)', style: theme.titleMedium),
          ),
        ],
      ),
    );
  }
}
