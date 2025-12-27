import 'package:flutter/material.dart';
import 'package:portfolio/theme/colors_model.dart';
import 'package:url_launcher/link.dart';

@immutable
class Frame extends StatelessWidget {
  const Frame({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.padding,
    this.animate = false,
    required this.child,
  });

  const factory Frame.container({Color? color, required Widget child}) =
      _FrameContainer;

  const factory Frame.card({
    Color? color,
    bool animate,
    VoidCallback? onTap,
    required Widget child,
  }) = _FrameCard;

  const factory Frame.link({
    Color? color,
    required String url,
    required Widget child,
  }) = _FrameLink;

  final bool animate;
  final Color? color;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget widget = child;

    if (padding != null) {
      widget = Padding(padding: padding!, child: widget);
    }

    if (onTap != null) {
      widget = InkWell(
        onTap: onTap,
        splashColor: context.colors.themeButton,
        child: widget,
      );
    }

    widget = Card(
      elevation: 0,
      color: color,
      margin: margin,
      clipBehavior: .hardEdge,
      child: widget,
    );

    if (animate) {
      return AnimatedSize(duration: const Duration(seconds: 1), child: widget);
    }

    return widget;
  }
}

@immutable
class _FrameContainer extends Frame {
  const _FrameContainer({super.color, required super.child});

  @override
  Widget build(BuildContext context) => Frame(
    color: color,
    animate: true,
    padding: const .all(16),
    margin: const .symmetric(vertical: 8, horizontal: 16),
    child: child,
  );
}

@immutable
class _FrameCard extends Frame {
  const _FrameCard({
    super.onTap,
    super.color,
    super.animate,
    required super.child,
  });

  @override
  Widget build(BuildContext context) => Frame(
    onTap: onTap,
    color: color,
    animate: animate,
    margin: const .all(8),
    padding: const .all(16),
    child: child,
  );
}

@immutable
class _FrameLink extends _FrameCard {
  const _FrameLink({super.color, required this.url, required super.child});

  final String url;

  @override
  Widget build(BuildContext context) => Link(
    uri: .parse(url),
    target: .blank,
    builder: (_, link) => _FrameCard(onTap: link, color: color, child: child),
  );
}
