import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/widgets/traffic_lights.dart';
import 'package:url_launcher/link.dart';

@immutable
class FrameFactory extends StatelessWidget {
  const FrameFactory({
    super.key,
    this.onTap,
    this.color,
    this.margin,
    this.padding,
    this.animate = false,
    required this.child,
  });

  const factory FrameFactory.controls({
    required Widget child,
    required String title,
    required bool isMinimized,
    Color? color,
    Color? titleColor,
    VoidCallback? onClose,
    VoidCallback? onMinimize,
    VoidCallback? onMaximize,
  }) = _FrameControls;

  const factory FrameFactory.container({
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    required Widget child,
  }) = _FrameContainer;

  const factory FrameFactory.card({
    Color? color,
    bool animate,
    VoidCallback? onTap,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    required Widget child,
  }) = _FrameCard;

  const factory FrameFactory.link({
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
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
        hoverDuration: const .new(milliseconds: 500),
        hoverColor: context.colors.cardHover,
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
      return AnimatedSize(
        alignment: .topCenter,
        duration: const .new(milliseconds: 700),
        child: widget,
      );
    }
    return widget;
  }
}

@immutable
class _FrameControls extends FrameFactory {
  const _FrameControls({
    required super.child,
    required this.title,
    required this.isMinimized,
    super.color,
    this.titleColor,
    this.onClose,
    this.onMinimize,
    this.onMaximize,
  });

  final String title;
  final bool isMinimized;
  final Color? titleColor;
  final VoidCallback? onClose;
  final VoidCallback? onMinimize;
  final VoidCallback? onMaximize;

  @override
  Widget build(BuildContext context) => FrameFactory(
    color: color,
    animate: true,
    padding: const .all(16),
    margin: const .symmetric(vertical: 8, horizontal: 16),
    child: Column(
      children: [
        Align(
          alignment: .topLeft,
          child: TrafficLights(
            title: Text(
              title,
              style: .new(color: titleColor, fontWeight: .bold),
            ),
            onClose: onClose,
            onMinimize: onMinimize,
            onMaximize: onMaximize,
          ),
        ),
        if (!isMinimized) child,
      ],
    ),
  );
}

@immutable
class _FrameContainer extends FrameFactory {
  const _FrameContainer({
    super.color,
    super.margin,
    super.padding,
    required super.child,
  });

  @override
  Widget build(BuildContext context) => FrameFactory(
    color: color,
    animate: true,
    padding: padding ?? const .all(16),
    margin: margin ?? const .symmetric(vertical: 8, horizontal: 16),
    child: child,
  );
}

@immutable
class _FrameCard extends FrameFactory {
  const _FrameCard({
    super.onTap,
    super.color,
    super.animate,
    super.margin,
    super.padding,
    required super.child,
  });

  @override
  Widget build(BuildContext context) => FrameFactory(
    onTap: onTap,
    color: color,
    animate: animate,
    margin: margin ?? const .all(8),
    padding: padding ?? const .all(16),
    child: child,
  );
}

@immutable
class _FrameLink extends _FrameCard {
  const _FrameLink({
    super.color,
    super.margin,
    super.padding,
    required super.child,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) => Link(
    uri: .parse(url),
    target: .blank,
    builder: (_, link) => _FrameCard(
      onTap: link,
      color: color,
      margin: margin,
      padding: padding,
      child: child,
    ),
  );
}
