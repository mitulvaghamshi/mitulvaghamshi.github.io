part of 'intro_card.dart';

@immutable
class _Widget940 extends StatelessWidget {
  const _Widget940();

  @override
  Widget build(BuildContext context) => const SizedBox(
    height: 420,
    child: Row(
      crossAxisAlignment: .stretch,
      children: [
        PictureWidget(width: 300),
        Expanded(
          child: Column(
            crossAxisAlignment: .stretch,
            children: [NameWidget(), DescriptionWidget(), EmptyWidget()],
          ),
        ),
        SocialButtons(),
      ],
    ),
  );
}

@immutable
class _Widget760 extends StatelessWidget {
  const _Widget760();

  @override
  Widget build(BuildContext context) => const Column(
    children: [
      SizedBox(
        height: 430,
        child: Row(
          crossAxisAlignment: .start,
          children: [
            PictureWidget(width: 300),
            Expanded(
              child: Column(
                crossAxisAlignment: .stretch,
                children: [NameWidget(), DescriptionWidget(), EmptyWidget()],
              ),
            ),
          ],
        ),
      ),
      SocialButtons(),
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
            PictureWidget(width: 280),
            Expanded(child: DescriptionWidget()),
          ],
        ),
      ),
      NameWidget(),
      SocialButtons(),
    ],
  );
}

@immutable
class _Widget420 extends StatelessWidget {
  const _Widget420();

  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: .stretch,
    children: [
      SizedBox(
        height: 400,
        child: Row(
          crossAxisAlignment: .stretch,
          children: [PictureWidget(width: 290), EmptyWidget()],
        ),
      ),
      NameWidget(),
      DescriptionWidget(),
      SocialButtons(),
    ],
  );
}

@immutable
class _Widget290 extends StatelessWidget {
  const _Widget290();

  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: .stretch,
    children: [
      PictureWidget(width: 290),
      NameWidget(),
      DescriptionWidget(),
      SocialButtons(),
    ],
  );
}
