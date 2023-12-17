part of 'intro_card.dart';

@immutable
class FullName extends StatelessWidget {
  const FullName({super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: context.colors.introText,
      fontSize: context.layout.dp,
      fontWeight: FontWeight.bold,
    );

    return Frame.card(
      color: context.colors.introCard,
      child: Text.rich(
        TextSpan(
          text: 'Software Developer\n',
          style: style,
          children: [
            TextSpan(
              text: 'Mitul Vaghamshi',
              style: style.copyWith(fontSize: context.layout.dp * 2),
              children: [
                TextSpan(
                  text: '_',
                  style: TextStyle(color: context.colors.themeButton),
                ),
              ],
            ),
          ],
        ),
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
      width: 300,
      cacheWidth: 300,
      fit: BoxFit.contain,
      colorBlendMode: BlendMode.color,
      color: context.colors.imageBlend,
      frameBuilder: (p1, child, frame, p4) => Frame(
        margin: EdgeInsets.all(context.layout.dp / 2),
        animate: true,
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
    return Frame.card(
      color: context.colors.introCard,
      child: Text(
        AppData.introText,
        style: TextStyle(
          color: context.colors.introText,
          fontSize: context.layout.dp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

@immutable
class SocialButtonBar extends StatelessWidget {
  const SocialButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Frame.card(
      color: context.colors.introCard,
      child: context.config.build(
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

  final Deux link;

  @override
  Widget build(BuildContext context) {
    final size = context.layout.dp * 2;
    final svg = AppData.buildSVG(
      color: context.colors.introText!,
      pathData: link.value,
    );
    return Link(
      uri: Uri.parse(link.url),
      target: LinkTarget.blank,
      builder: (_, followLink) => Frame(
        onTap: followLink,
        color: Colors.transparent,
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.all(8),
        child: SvgPicture.string(svg, width: size, height: size),
      ),
    );
  }
}
