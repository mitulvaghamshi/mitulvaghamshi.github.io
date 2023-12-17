import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/app_data.dart';
import 'package:portfolio/widgets/frame.dart';
import 'package:url_launcher/link.dart';

@immutable
class FullName extends StatelessWidget {
  const FullName({super.key});

  @override
  Widget build(BuildContext context) {
    final layout = context.layout.data;
    final colors = context.colors;
    final style = TextStyle(
      color: colors.introText,
      fontSize: layout.dp,
      fontWeight: FontWeight.bold,
    );
    return Frame.card(
      color: colors.introCard,
      child: Text.rich(
        TextSpan(text: 'Software Developer\n', style: style, children: [
          TextSpan(
            text: 'Mitul Vaghamshi',
            style: style.copyWith(fontSize: layout.dp * 2),
            children: [
              TextSpan(
                text: '_',
                style: TextStyle(color: colors.themeButton),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

@immutable
class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/me.webp',
      width: 340,
      cacheWidth: 340,
      fit: BoxFit.contain,
      colorBlendMode: BlendMode.color,
      color: context.colors.imageBlend,
      frameBuilder: (p1, child, frame, p4) => Frame(
        animate: true,
        margin: EdgeInsets.all(context.layout.data.dp / 2),
        child: child,
      ),
    );
  }
}

@immutable
class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Frame.card(
      color: colors.introCard,
      child: Text(
        AppData.introText,
        style: TextStyle(
          color: colors.introText,
          fontSize: context.layout.data.dp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

@immutable
class SocialButtonRow extends StatelessWidget {
  const SocialButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Frame.card(
      color: context.colors.introCard,
      child: context.layout.build(
        mobileSmall290: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: AppData.socialLinks.map(SocialButton.entry).toList(),
        ),
      ),
    );
  }
}

@immutable
class SocialButton extends StatelessWidget {
  const SocialButton.entry(this.link, {super.key});

  final Pair link;

  @override
  Widget build(BuildContext context) {
    final size = context.layout.data.dp * 2;
    final svg = AppData.buildSVG(
        color: context.colors.introText!, pathData: link.value);
    return Link(
      uri: Uri.parse(link.url),
      target: LinkTarget.blank,
      builder: (context, followLink) => Frame(
        onTap: followLink,
        color: Colors.transparent,
        padding: const EdgeInsets.all(2),
        child: SvgPicture.string(svg, width: size, height: size),
      ),
    );
  }
}
