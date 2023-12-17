part of 'intro_card.dart';

@immutable
class _Widget940 extends StatelessWidget {
  const _Widget940();

  @override
  Widget build(BuildContext context) {
    return const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ProfilePicture(),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [FullName(), Description(), SocialButtonBar()],
        ),
      ),
    ]);
  }
}

@immutable
class _Widget760 extends StatelessWidget {
  const _Widget760();

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ProfilePicture(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [FullName(), Description()],
          ),
        ),
      ]),
      SocialButtonBar(),
    ]);
  }
}

@immutable
class _Widget640 extends StatelessWidget {
  const _Widget640();

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(children: [ProfilePicture(), FullName()]),
        Expanded(child: Description()),
      ]),
      SocialButtonBar(),
    ]);
  }
}

@immutable
class _Widget290 extends StatelessWidget {
  const _Widget290();

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      ProfilePicture(),
      FullName(),
      Description(),
      SocialButtonBar(),
    ]);
  }
}
