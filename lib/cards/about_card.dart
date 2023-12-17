import 'package:flutter/material.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/app_data.dart';
import 'package:portfolio/widgets/frame.dart';

@immutable
class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.layout.data;
    final colors = context.colors;
    final style = TextStyle(
      color: colors.aboutText,
      fontSize: layout.dp,
      fontWeight: FontWeight.bold,
    );
    final space = SizedBox.square(dimension: layout.dp);
    final items = [
      Image.asset('assets/icon.webp'),
      space,
      Text('© ${DateTime.now().year} Portfolio App. ', style: style),
      Text('All Rights Reserved. ', style: style),
      Text('Developed by Mitul Vaghamshi.', style: style),
    ];
    return Padding(
      padding: EdgeInsets.only(bottom: layout.dp / 2),
      child: Frame.container(
        color: colors.aboutContainer,
        child: context.layout.build(
          mobileSmall290: Column(
            children: [...items, space, const AboutButtons()],
          ),
          tabletLarge760: Column(
            children: [Row(children: items), const AboutButtons()],
          ),
        ),
      ),
    );
  }
}

@immutable
class AboutButtons extends StatelessWidget {
  const AboutButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.layout.data;
    final colors = context.colors;
    final width = context.width;
    final buttonWidth =
        width / (width < 420 ? 1 : (width < 940 ? 2 : 4)) - layout.dp * 1.5;
    final style = TextStyle(
      color: colors.aboutText,
      fontSize: layout.dp,
      fontWeight: FontWeight.bold,
    );
    return Wrap(children: [
      SizedBox(
        width: buttonWidth,
        child: Frame.card(
          onTap: () => showLicensePage(context: context),
          color: colors.aboutCard,
          child: Text(
            'See Licenses',
            textAlign: TextAlign.center,
            style: style,
          ),
        ),
      ),
      ...AppData.footerLinks.map((link) => SizedBox(
          width: buttonWidth,
          child: Frame.link(
            url: link.url,
            color: colors.aboutCard,
            child: Text(
              link.value,
              style: style,
              textAlign: TextAlign.center,
            ),
          ))),
    ]);
  }
}
