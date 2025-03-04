part of 'intro_card.dart';

@immutable
class _Widget940 extends StatelessWidget {
  const _Widget940();

  @override
  Widget build(BuildContext context) => const Row(
    crossAxisAlignment: .end,
    children: [
      ProfilePicture(),
      Expanded(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [FullName(), Description()],
        ),
      ),
      SocialButtonBar(),
    ],
  );
}

@immutable
class _Widget760 extends StatelessWidget {
  const _Widget760();

  @override
  Widget build(BuildContext context) => const Column(
    children: [
      Row(
        crossAxisAlignment: .start,
        children: [
          ProfilePicture(),
          Expanded(
            child: Column(
              crossAxisAlignment: .stretch,
              children: [FullName(), Description()],
            ),
          ),
        ],
      ),
      SocialButtonBar(),
    ],
  );
}

@immutable
class _Widget640 extends StatelessWidget {
  const _Widget640();

  @override
  Widget build(BuildContext context) => const Column(
    children: [
      Row(
        crossAxisAlignment: .start,
        children: [
          ProfilePicture(),
          Expanded(child: FullName()),
        ],
      ),
      SocialButtonBar(),
      Description(),
    ],
  );
}

@immutable
class _Widget290 extends StatelessWidget {
  const _Widget290();

  @override
  Widget build(BuildContext context) => const Column(
    children: [ProfilePicture(), FullName(), Description(), SocialButtonBar()],
  );
}
