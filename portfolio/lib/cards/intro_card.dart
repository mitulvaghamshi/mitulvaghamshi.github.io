import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/state/app_scope.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/utils/breakpoint.dart';
import 'package:portfolio/utils/static_data.dart';
import 'package:portfolio/widgets/empty_widget.dart';
import 'package:portfolio/widgets/frame_factory.dart';

@immutable
class IntroCard extends StatefulWidget {
  const IntroCard({super.key});

  @override
  State<IntroCard> createState() => _IntroCardState();
}

class _IntroCardState extends State<IntroCard> {
  bool _isMinimized = false;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const .only(top: 16),
    child: FrameFactory.controls(
      title: 'Introduction',
      titleColor: context.colors.introText,
      color: context.colors.introContainer,
      isMinimized: _isMinimized,
      onMinimize: () => setState(() => _isMinimized = !_isMinimized),
      child: context.breakpoint.build(
        smallMobile: const _SmallMobile(),
        largeMobile: const _LargeMobile(),
        mediumTablet: const _MediumTablet(),
        largeTablet: const _LargeTablet(),
        smallLaptop: const _SmallLaptop(),
      ),
    ),
  );
}

//
// START: Layouts
//

@immutable
class _SmallLaptop extends StatelessWidget {
  const _SmallLaptop();

  @override
  Widget build(BuildContext context) => const SizedBox(
    height: 420,
    child: Row(
      crossAxisAlignment: .stretch,
      children: [
        _PictureWidget(width: 300),
        Expanded(
          child: Column(
            crossAxisAlignment: .stretch,
            children: [_NameWidget(), _SummaryWidget(), EmptyWidget()],
          ),
        ),
        _SocialButtons(),
      ],
    ),
  );
}

@immutable
class _LargeTablet extends StatelessWidget {
  const _LargeTablet();

  @override
  Widget build(BuildContext context) => const Column(
    children: [
      SizedBox(
        height: 430,
        child: Row(
          crossAxisAlignment: .start,
          children: [
            _PictureWidget(width: 300),
            Expanded(
              child: Column(
                crossAxisAlignment: .stretch,
                children: [_NameWidget(), _SummaryWidget(), EmptyWidget()],
              ),
            ),
          ],
        ),
      ),
      _SocialButtons(),
    ],
  );
}

@immutable
class _MediumTablet extends StatelessWidget {
  const _MediumTablet();

  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: .stretch,
    children: [
      SizedBox(
        height: 400,
        child: Row(
          crossAxisAlignment: .stretch,
          children: [
            _PictureWidget(width: 280),
            Expanded(child: _SummaryWidget()),
          ],
        ),
      ),
      _NameWidget(),
      _SocialButtons(),
    ],
  );
}

@immutable
class _LargeMobile extends StatelessWidget {
  const _LargeMobile();

  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: .stretch,
    children: [
      SizedBox(
        height: 400,
        child: Row(
          crossAxisAlignment: .stretch,
          children: [_PictureWidget(width: 290), EmptyWidget()],
        ),
      ),
      _NameWidget(),
      _SummaryWidget(),
      _SocialButtons(),
    ],
  );
}

@immutable
class _SmallMobile extends StatelessWidget {
  const _SmallMobile();

  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: .stretch,
    children: [
      _PictureWidget(width: 290),
      _NameWidget(),
      _SummaryWidget(),
      _SocialButtons(),
    ],
  );
}

//
// END: Layouts
//

// -------------

//
// START: Widgets
//

@immutable
class _NameWidget extends StatelessWidget {
  const _NameWidget();

  @override
  Widget build(BuildContext context) {
    final style = TextTheme.of(context).apply(
      bodyColor: context.colors.introText,
      displayColor: context.colors.introText,
    );
    return FrameFactory.card(
      color: context.colors.introCard,
      child: Text.rich(
        TextSpan(
          text: 'Software Developer',
          style: style.titleSmall!.copyWith(fontWeight: .bold),
          children: [
            TextSpan(
              text: '_\n',
              style: style.headlineMedium!.copyWith(
                fontWeight: .bold,
                color: context.colors.themeButton,
              ),
            ),
            TextSpan(
              text: 'Mitul Vaghamshi',
              style: style.headlineLarge!.copyWith(fontWeight: .bold),
            ),
          ],
        ),
      ),
    );
  }
}

@immutable
class _PictureWidget extends StatelessWidget {
  const _PictureWidget({required this.width});

  final int width;

  @override
  Widget build(BuildContext context) => Image.asset(
    StaticData.imgMeSrc,
    width: width.toDouble(),
    cacheWidth: width,
    fit: .cover,
    colorBlendMode: .color,
    color: context.colors.imageBlend,
    frameBuilder: (_, child, _, _) {
      return FrameFactory(margin: const .all(8), animate: true, child: child);
    },
  );
}

@immutable
class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget();

  @override
  Widget build(BuildContext context) {
    final style = TextTheme.of(context).apply(
      bodyColor: context.colors.introText,
      displayColor: context.colors.introText,
    );
    return FrameFactory.card(
      color: context.colors.introCard,
      child: Text(StaticData.summaryText, style: style.bodyMedium),
    );
  }
}

@immutable
class _SocialButtons extends StatelessWidget {
  const _SocialButtons();

  @override
  Widget build(BuildContext context) {
    final size = context.width < 300
        ? 18.0
        : context.width > 360
        ? 32.0
        : 20.0;
    final items = StaticData.socialLinks.map((link) {
      return FrameFactory.link(
        url: link.url,
        margin: .zero,
        padding: const .all(8),
        color: Colors.transparent,
        child: SvgPicture.string(
          StaticData.buildSVG(
            color: context.colors.introText!,
            data: link.value,
          ),
          width: size,
          height: size,
        ),
      );
    });
    return FrameFactory.card(
      color: context.colors.introCard,
      child: context.breakpoint.build(
        smallMobile: Row(
          mainAxisAlignment: .spaceBetween,
          children: items.toList(),
        ),
        smallLaptop: Column(
          mainAxisAlignment: .spaceBetween,
          children: items.toList(),
        ),
      ),
    );
  }
}

//
// END: Widgets
//
