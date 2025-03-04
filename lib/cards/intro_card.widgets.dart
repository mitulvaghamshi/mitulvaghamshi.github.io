part of 'intro_card.dart';

@immutable
class FullName extends StatelessWidget {
  const FullName({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.apply(
          bodyColor: context.colors.introText,
          displayColor: context.colors.introText,
        );
    return Frame.card(
      color: context.colors.introCard,
      child: Text.rich(
        TextSpan(
          text: 'Software Developer\n',
          style: style.titleMedium,
          children: [
            TextSpan(
              text: 'Mitul Vaghamshi',
              style: style.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '_',
              style: style.headlineLarge!.copyWith(
                color: context.colors.themeButton,
              ),
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
      frameBuilder: (_, child, _, _) => Frame(
        margin: const EdgeInsets.all(8),
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
    final style = Theme.of(context).textTheme.apply(
          bodyColor: context.colors.introText,
          displayColor: context.colors.introText,
        );
    return Frame.card(
      color: context.colors.introCard,
      child: Text(AppData.introText, style: style.bodyLarge),
    );
  }
}

@immutable
class SocialButtonBar extends StatelessWidget {
  const SocialButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    final items = AppData.socialLinks.map(SocialButton.new).toList();
    return Frame.card(
      color: context.colors.introCard,
      child: context.config.build(
        mobileSmall290: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items,
        ),
        laptopSmall940: Column(children: items),
        desktop2k1440: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items,
        ),
      ),
    );
  }
}

@immutable
class SocialButton extends StatelessWidget {
  const SocialButton(this.link, {super.key});

  final Deux link;

  @override
  Widget build(BuildContext context) {
    final size = context.width > 420 ? 32.0 : 24.0;
    return Link(
      uri: Uri.parse(link.url),
      target: LinkTarget.blank,
      builder: (_, followLink) => Frame(
        onTap: followLink,
        color: Colors.transparent,
        margin: EdgeInsets.zero,
        padding: const EdgeInsets.all(8),
        child: SvgPicture.string(
          AppData.colorSvg(color: context.colors.introText!, data: link.value),
          width: size,
          height: size,
        ),
      ),
    );
  }
}
