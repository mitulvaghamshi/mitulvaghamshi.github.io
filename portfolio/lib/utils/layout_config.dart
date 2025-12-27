import 'package:flutter/material.dart';

enum LayoutConfig {
  mobileTiny(min: 0, max: 290),
  mobileSmall(min: 290, max: 320),
  mobileMedium(min: 320, max: 420),
  mobileLarge(min: 420, max: 560),
  tabletSmall(min: 560, max: 640),
  tabletMedium(min: 640, max: 760),
  tabletLarge(min: 760, max: 940),
  laptopSmall(min: 940, max: 1080),
  laptopMedium(min: 1080, max: 1280),
  laptopLarge(min: 1280, max: 1440),
  desktop2k(min: 1440, max: 1920),
  desktop4k(min: 1920, max: 3840);

  const LayoutConfig({required this.min, required this.max});

  factory LayoutConfig.from(double width) =>
      values.singleWhere((size) => size.canHold(width));

  final double min;
  final double max;

  bool canHold(double width) => width >= min && width < max;

  /// Responsive widget builder with fallback.
  /// Builds widgets based on screen size using named breakpoints.
  /// Unspecified breakpoints show a [mobileTiny].
  ///
  /// Providing a widget for [mobileSmall290] will display that widget
  /// for any screen with `minWidth >= 290`.
  ///
  /// Each breakpoint covers smaller sizes, scaling the widget as needed.
  /// Breakpoint widgets are only initialized when the breakpoint is active.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// @immutable
  /// class SampleWidget extends StatelessWidget {
  ///   const SampleWidget({super.key});
  ///
  ///   @override
  ///   Widget build(BuildContext context) => Padding(
  ///     padding: const .all(16),
  ///     child: context.layout.build(
  ///       mobileSmall290: const _Widget290(),
  ///       tabletMedium640: const _Widget640(),
  ///       tabletLarge760: const _Widget760(),
  ///       laptopSmall940: const _Widget940(),
  ///     ),
  ///   );
  /// }
  /// ```
  Widget build({
    Widget? mobileSmall290,
    Widget? mobileMedium320,
    Widget? mobileLarge420,
    Widget? tabletSmall560,
    Widget? tabletMedium640,
    Widget? tabletLarge760,
    Widget? laptopSmall940,
    Widget? laptopMedium1080,
    Widget? laptopLarge1280,
    Widget? desktop2k1440,
    Widget? desktop4k1920,
  }) => switch (this) {
    mobileSmall => mobileSmall290 ?? _placeholder,
    mobileMedium => mobileMedium320 ?? mobileSmall290 ?? _placeholder,
    mobileLarge =>
      mobileLarge420 ?? mobileMedium320 ?? mobileSmall290 ?? _placeholder,
    tabletSmall =>
      tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
    tabletMedium =>
      tabletMedium640 ??
          tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
    tabletLarge =>
      tabletLarge760 ??
          tabletMedium640 ??
          tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
    laptopSmall =>
      laptopSmall940 ??
          tabletLarge760 ??
          tabletMedium640 ??
          tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
    laptopMedium =>
      laptopMedium1080 ??
          laptopSmall940 ??
          tabletLarge760 ??
          tabletMedium640 ??
          tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
    laptopLarge =>
      laptopLarge1280 ??
          laptopMedium1080 ??
          laptopSmall940 ??
          tabletLarge760 ??
          tabletMedium640 ??
          tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
    desktop2k =>
      desktop2k1440 ??
          laptopLarge1280 ??
          laptopMedium1080 ??
          laptopSmall940 ??
          tabletLarge760 ??
          tabletMedium640 ??
          tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
    desktop4k =>
      desktop4k1920 ??
          desktop2k1440 ??
          laptopLarge1280 ??
          laptopMedium1080 ??
          laptopSmall940 ??
          tabletLarge760 ??
          tabletMedium640 ??
          tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
    _ => _placeholder,
  };
}

const _placeholder = Placeholder();
