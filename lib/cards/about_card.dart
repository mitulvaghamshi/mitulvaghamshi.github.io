import 'package:flutter/material.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/app_data.dart';
import 'package:portfolio/frame.dart';

@immutable
class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: context.colors.aboutText,
      fontSize: context.layout.dp,
      fontWeight: FontWeight.bold,
    );

    final items = [
      Padding(
        padding: EdgeInsets.all(context.layout.dp / 2),
        child: Image.asset('assets/icon.webp'),
      ),
      SizedBox.square(dimension: context.layout.dp),
      Text('© ${DateTime.now().year} Portfolio App. ', style: style),
      Text('All Rights Reserved. ', style: style),
      Text('Developed by Mitul Vaghamshi.', style: style),
    ];

    return Padding(
      padding: EdgeInsets.only(bottom: context.layout.dp / 2),
      child: Frame.container(
        color: context.colors.aboutContainer,
        child: context.config.build(
          mobileSmall290: Column(children: [
            ...items,
            SizedBox.square(dimension: context.layout.dp),
            const _AboutButtons()
          ]),
          tabletLarge760: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: items),
            const _AboutButtons()
          ]),
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
    final width = context.width /
            (context.width < 420 ? 1 : (context.width < 940 ? 2 : 4)) -
        context.layout.dp * 1.5;

    final textStyle = TextStyle(
      color: context.colors.aboutText,
      fontSize: context.layout.dp,
      fontWeight: FontWeight.bold,
    );

    return Wrap(children: [
      ...AppData.footerLinks.map((link) {
        return SizedBox(
          width: width,
          child: Frame.link(
            url: link.url,
            color: context.colors.aboutCard,
            child: Text(
              link.value,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        );
      }),
      SizedBox(
        width: width,
        child: Frame.card(
          onTap: () => showLicensePage(context: context),
          color: context.colors.aboutCard,
          child: Text(
            'See Licenses',
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
      ),
    ]);
  }
}
