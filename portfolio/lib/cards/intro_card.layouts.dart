part of 'intro_card.dart';

@immutable
class _Widget940 extends StatelessWidget {
  const _Widget940();

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 420,
    child: Row(
      crossAxisAlignment: .stretch,
      children: [
        const ProfilePicture(width: 300),
        Expanded(
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              const FullName(),
              const Description(),
              Expanded(
                child: Frame.card(
                  animate: true,
                  color: context.colors.introCard,
                  child: const SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
        const SocialButtons(),
      ],
    ),
  );
}

@immutable
class _Widget760 extends StatelessWidget {
  const _Widget760();

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SizedBox(
        height: 430,
        child: Row(
          crossAxisAlignment: .start,
          children: [
            const ProfilePicture(width: 300),
            Expanded(
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  const FullName(),
                  const Description(),
                  Expanded(
                    child: Frame.card(
                      animate: true,
                      color: context.colors.introCard,
                      child: const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const SocialButtons(),
    ],
  );
}

@immutable
class _Widget640 extends StatelessWidget {
  const _Widget640();

  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: .stretch,
    children: [
      SizedBox(
        height: 400,
        child: Row(
          crossAxisAlignment: .stretch,
          children: [
            ProfilePicture(width: 280),
            Expanded(child: Description()),
          ],
        ),
      ),
      FullName(),
      SocialButtons(),
    ],
  );
}

@immutable
class _Widget290 extends StatelessWidget {
  const _Widget290();

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: .stretch,
    children: [
      SizedBox(
        height: 400,
        child: Row(
          crossAxisAlignment: .stretch,
          mainAxisAlignment: .spaceBetween,
          children: [
            const ProfilePicture(width: 300),
            Expanded(
              child: Frame.card(
                animate: true,
                color: context.colors.introCard,
                child: const SizedBox.shrink(),
              ),
            ),
            const SocialButtons(),
          ],
        ),
      ),
      const FullName(),
      const Description(),
    ],
  );
}
