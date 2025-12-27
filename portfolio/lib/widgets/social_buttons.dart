import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/frame.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/colors_model.dart';
import 'package:portfolio/utils/app_content.dart';
import 'package:portfolio/widgets/traffic_lights.dart';
import 'package:url_launcher/link.dart';

@immutable
class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final items = AppContent.socialLinks.map(_SocialButton.new).toList();
    return Frame.card(
      color: context.colors.introCard,
      child: context.config.build(
        mobileSmall290: Column(
          mainAxisAlignment: .spaceBetween,
          children: items,
        ),
        tabletMedium640: Column(
          crossAxisAlignment: .start,
          children: [
            const TrafficLights(title: 'connect.txt'),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: .spaceBetween, children: items),
          ],
        ),
        laptopSmall940: Column(
          mainAxisAlignment: .spaceBetween,
          children: items,
        ),
      ),
    );
  }
}

@immutable
class _SocialButton extends StatelessWidget {
  const _SocialButton(this.link, {super.key});

  final UrlPair link;

  @override
  Widget build(BuildContext context) => Link(
    uri: .parse(link.url),
    target: .blank,
    builder: (_, followLink) => Frame(
      onTap: followLink,
      margin: .zero,
      padding: const .all(8),
      color: Colors.transparent,
      child: SvgPicture.string(
        AppContent.buildSVG(color: context.colors.introText!, data: link.value),
        width: context.width > 420 ? 32 : 24,
        height: context.width > 420 ? 32 : 24,
      ),
    ),
  );
}
