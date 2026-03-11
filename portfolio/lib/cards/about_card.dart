import 'package:flutter/material.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/breakpoint.dart';
import 'package:portfolio/utils/static_data.dart';
import 'package:portfolio/widgets/frame_factory.dart';

@immutable
class AboutCard extends StatefulWidget {
  const AboutCard({super.key});

  @override
  State<AboutCard> createState() => _AboutCardState();
}

class _AboutCardState extends State<AboutCard> {
  bool _isMinimized = false;

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context).apply(
      bodyColor: context.colors.aboutText,
      displayColor: context.colors.aboutText,
    );
    final items = [
      Padding(
        padding: const .all(16),
        child: Image.asset(StaticData.imgIconSrc),
      ),
      const SizedBox.square(dimension: 16),
      Text(
        '© ${DateTime.now().year} Portfolio App. ',
        style: theme.titleMedium,
      ),
      Text('All Rights Reserved. ', style: theme.titleMedium),
      Text('Developed by Mitul Vaghamshi.', style: theme.titleMedium),
    ];
    return Padding(
      padding: const .only(bottom: 8),
      child: FrameFactory.controls(
        title: 'About',
        titleColor: context.colors.aboutText,
        color: context.colors.aboutContainer,
        isMinimized: _isMinimized,
        onMinimize: () => setState(() => _isMinimized = !_isMinimized),
        child: context.breakpoint.build(
          smallMobile: Column(
            children: [
              ...items,
              const SizedBox.square(dimension: 16),
              const _AboutButtons(),
            ],
          ),
          largeTablet: Column(
            children: [
              Row(mainAxisAlignment: .center, children: items),
              const _AboutButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
class _AboutButtons extends StatelessWidget {
  const _AboutButtons();

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context).apply(
      bodyColor: context.colors.aboutText,
      displayColor: context.colors.aboutText,
    );
    return Wrap(
      alignment: .center,
      children: [
        for (var item in StaticData.footerLinks)
          SizedBox(
            width: 200,
            child: FrameFactory.link(
              url: item.url,
              color: context.colors.aboutCard,
              child: Text(
                item.value,
                textAlign: .center,
                style: theme.titleMedium,
              ),
            ),
          ),
        SizedBox(
          width: 200,
          child: FrameFactory.card(
            onTap: () => showLicensePage(context: context),
            color: context.colors.aboutCard,
            child: Text(
              'See licenses',
              textAlign: .center,
              style: theme.titleMedium,
            ),
          ),
        ),
      ],
    );
  }
}
