import 'package:flutter/material.dart';
import 'package:layout_breakpoint/src/layout_data.dart';

enum LayoutConfig {
  // Placeholder
  placeholder(data: palceholderData),
  // Mobile portrait
  mobileSmall(data: smallMobile),
  mobileMedium(data: mediumMobile),
  mobileLarge(data: largeMobile),
  // Tablet portrait // Mobile Landscape
  tabletSmall(data: smallTablet),
  tabletMedium(data: mediumTablet),
  tabletLarge(data: largeTablet),
  // Laptop Landscape // Tablet Landscape
  laptopSmall(data: smallLaptop),
  laptopMedium(data: mediumLaptop),
  laptopLarge(data: largeLaptop),
  // Desktop Landscape // Laptop Landscape
  desktop2k(data: desktop_2k),
  desktop4k(data: desktop_4k);

  const LayoutConfig({required this.data});

  final LayoutData data;

  static LayoutConfig from(final double width) =>
      values.firstWhere((final layout) => layout.data.isWithin(width),
          orElse: () => placeholder);

  /// Responsive widget builder with fallback.
  ///
  /// All breakpoints are optional, in that case it will show a [placeholder]
  /// for different sections of the screen.
  ///
  /// All parameters named after its minimum supported width,
  /// i.g. providing a widget for [mobileSmall290] breakpoint will only display
  /// that widget for any screen greater then or equal to `290`
  /// (`minWidth >= 290`), a [placeholder] otherwise.
  ///
  /// Any given breakpoint automatically covers all absent breakpoints,
  /// and display same widget using scaling factor for any active breakpoint.
  ///
  /// Example:
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
  ///
  /// Providing possible breakpoints upfront is complately safe,
  /// only widget matching breakpoint gets initialized,
  /// other remains untouched until minimum width jump to other breakpoint
  /// by resizing browser window or device rotation.
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
