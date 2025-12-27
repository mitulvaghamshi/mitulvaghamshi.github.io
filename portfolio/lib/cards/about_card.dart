import 'package:flutter/material.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/colors_model.dart';
import 'package:portfolio/utils/app_content.dart';

@immutable
class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.apply(
      bodyColor: context.colors.aboutText,
      displayColor: context.colors.aboutText,
    );
    final items = [
      Padding(padding: const .all(16), child: Image.asset('assets/icon.webp')),
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
      child: Frame.container(
        color: context.colors.aboutContainer,
        child: context.config.build(
          mobileSmall290: Column(
            children: [
              ...items,
              const SizedBox.square(dimension: 16),
              const _AboutButtons(),
            ],
          ),
          tabletLarge760: Column(
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
    final theme = Theme.of(context).textTheme.apply(
      bodyColor: context.colors.aboutText,
      displayColor: context.colors.aboutText,
    );
    return Wrap(
      alignment: .center,
      children: [
        ...AppContent.footerLinks.map((link) {
          return SizedBox(
            width: 200,
            child: Frame.link(
              url: link.url,
              color: context.colors.aboutCard,
              child: Text(
                link.value,
                textAlign: .center,
                style: theme.titleMedium,
              ),
            ),
          );
        }),
        SizedBox(
          width: 200,
          child: Frame.card(
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
