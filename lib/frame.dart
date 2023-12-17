import 'package:flutter/material.dart';
import 'package:portfolio/state/app_scope.dart';
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

  const factory Frame.container({
    final Color? color,
    required final Widget child,
  }) = _FrameContainer;

  const factory Frame.card({
    final Color? color,
    final bool animate,
    final VoidCallback? onTap,
    required final Widget child,
  }) = _FrameCard;

  const factory Frame.link({
    final Color? color,
    required final String url,
    required final Widget child,
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
    if (padding != null) widget = Padding(padding: padding!, child: widget);
    if (onTap != null) widget = InkWell(onTap: onTap, child: widget);

    widget = Card(
      elevation: 0,
      color: color,
      margin: margin,
      clipBehavior: Clip.hardEdge,
      child: widget,
    );

    if (!animate) return widget;

    return AnimatedSize(duration: const Duration(seconds: 1), child: widget);
  }
}

@immutable
class _FrameLink extends _FrameCard {
  const _FrameLink({
    super.color,
    required this.url,
    required super.child,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(url),
      target: LinkTarget.blank,
      builder: (_, followLink) => _FrameCard(
        onTap: followLink,
        color: color,
        child: child,
      ),
    );
  }
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
  Widget build(BuildContext context) {
    return Frame(
      onTap: onTap,
      color: color,
      animate: animate,
      padding: EdgeInsets.all(context.layout.dp),
      margin: EdgeInsets.all(context.layout.dp / 2),
      child: child,
    );
  }
}

@immutable
class _FrameContainer extends Frame {
  const _FrameContainer({super.color, required super.child});

  @override
  Widget build(BuildContext context) {
    return Frame(
      color: color,
      animate: true,
      padding: EdgeInsets.all(context.layout.dp / 2),
      margin: EdgeInsets.symmetric(
        vertical: context.layout.dp / 2,
        horizontal: context.layout.dp,
      ),
      child: child,
    );
  }
}
