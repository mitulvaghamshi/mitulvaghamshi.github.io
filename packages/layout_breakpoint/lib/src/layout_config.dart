import 'package:flutter/material.dart';
import 'package:layout_breakpoint/src/layout_data.dart';

enum LayoutConfig {
  // mobile(mobileData),
  // tablet(tabletData),
  // laptop(laptopData),
  // desktop(desktopData),

  // Placeholder
  mobileTiny(tinyMobile),
  // Mobile portrait
  mobileSmall(smallMobile),
  mobileMedium(mediumMobile),
  mobileLarge(largeMobile),
  // Tablet portrait // Mobile Landscape
  tabletSmall(smallTablet),
  tabletMedium(mediumTablet),
  tabletLarge(largeTablet),
  // Laptop Landscape // Tablet Landscape
  laptopSmall(smallLaptop),
  laptopMedium(mediumLaptop),
  laptopLarge(largeLaptop),
  // Desktop Landscape // Laptop Landscape
  desktop2k(desktop_2k),
  desktop4k(desktop_4k);

  const LayoutConfig(this.data);

  final LayoutData data;

  static LayoutConfig from(final double width) =>
      values.firstWhere((final layout) => layout.data.isWithin(width),
          orElse: () => mobileTiny);

  // Widget build2({
  //   final Widget? mobile,
  //   final Widget? tablet,
  //   final Widget? laptop,
  //   final Widget? desktop,
  // }) {
  //   return switch (this) {
  //     LayoutConfig.mobile => mobile ?? _placeholder,
  //     LayoutConfig.tablet => tablet ?? mobile ?? _placeholder,
  //     LayoutConfig.laptop => laptop ?? tablet ?? mobile ?? _placeholder,
  //     LayoutConfig.desktop =>
  //       desktop ?? laptop ?? tablet ?? mobile ?? _placeholder,
  //     _ => _placeholder,
  //   };
  // }

  /// Responsive widget builder with fallback. Builds widgets based on screen size
  /// using named breakpoints. Unspecified breakpoints show a [mobileTiny].
  ///
  /// For example, providing a widget for [mobileSmall290] will display that widget
  /// for screens with `minWidth >= 290`.
  ///
  /// Each breakpoint covers smaller sizes, scaling the widget as needed.
  /// Breakpoint widgets are only initialized when the breakpoint is active.
  ///
  /// Example:
  ///
  /// ```dart
  /// @immutable
  /// class SampleWidget extends StatelessWidget {
  ///   const SampleWidget({super.key});
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return Padding(
  ///       padding: const EdgeInsets.all(16),
  ///       child: context.layout.build(
  ///         mobileSmall290: const _Widget290(),
  ///         tabletMedium640: const _Widget640(),
  ///         tabletLarge760: const _Widget760(),
  ///         laptopSmall940: const _Widget940(),
  ///       ),
  ///     );
  ///   }
  /// }
  /// ```
  Widget build({
    final Widget? mobileSmall290,
    final Widget? mobileMedium320,
    final Widget? mobileLarge420,
    final Widget? tabletSmall560,
    final Widget? tabletMedium640,
    final Widget? tabletLarge760,
    final Widget? laptopSmall940,
    final Widget? laptopMedium1080,
    final Widget? laptopLarge1280,
    final Widget? desktop2k1440,
    final Widget? desktop4k1920,
  }) {
    return switch (this) {
      mobileSmall => mobileSmall290 ?? //
          _placeholder,
      mobileMedium => mobileMedium320 ?? //
          mobileSmall290 ?? //
          _placeholder,
      mobileLarge => mobileLarge420 ?? //
          mobileMedium320 ?? //
          mobileSmall290 ?? //
          _placeholder,
      tabletSmall => tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
      tabletMedium => tabletMedium640 ??
          tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
      tabletLarge => tabletLarge760 ??
          tabletMedium640 ??
          tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
      laptopSmall => laptopSmall940 ??
          tabletLarge760 ??
          tabletMedium640 ??
          tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
      laptopMedium => laptopMedium1080 ??
          laptopSmall940 ??
          tabletLarge760 ??
          tabletMedium640 ??
          tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
      laptopLarge => laptopLarge1280 ??
          laptopMedium1080 ??
          laptopSmall940 ??
          tabletLarge760 ??
          tabletMedium640 ??
          tabletSmall560 ??
          mobileLarge420 ??
          mobileMedium320 ??
          mobileSmall290 ??
          _placeholder,
      desktop2k => desktop2k1440 ??
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
      desktop4k => desktop4k1920 ??
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
}

const _placeholder = Placeholder();
