part of 'intro_card.dart';

@immutable
class _Widget1440 extends StatelessWidget {
  const _Widget1440();

  @override
  Widget build(BuildContext context) {
    return const Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      ProfilePicture(),
      Expanded(
        flex: 3,
        child: Column(children: [FullName(), AboutCard(), SocialButtonBar()]),
      ),
      Expanded(child: Description()),
    ]);
  }
}

@immutable
class _Widget940 extends StatelessWidget {
  const _Widget940();

  @override
  Widget build(BuildContext context) {
    return const Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
      ProfilePicture(),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [FullName(), Description()],
        ),
      ),
      SocialButtonBar(),
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
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ProfilePicture(), Expanded(child: FullName())],
      ),
      SocialButtonBar(),
      Description(),
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
