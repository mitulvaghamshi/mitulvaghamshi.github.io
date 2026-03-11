import 'package:flutter/material.dart';

enum Breakpoint {
  deviceX(min: 0, max: 290),
  mobileS(min: 290, max: 320),
  mobileM(min: 320, max: 420),
  mobileL(min: 420, max: 560),
  tabletS(min: 560, max: 640),
  tabletM(min: 640, max: 760),
  tabletL(min: 760, max: 940),
  laptopS(min: 940, max: 1080),
  laptopM(min: 1080, max: 1280),
  laptopL(min: 1280, max: 1440),
  dsktopS(min: 1440, max: 1920),
  dsktopM(min: 1920, max: 3840),
  dsktopL(min: 3840, max: 7680);

  const Breakpoint({required this.min, required this.max});

  factory Breakpoint.from(double width) =>
      values.singleWhere((size) => size.canHold(width));

  final double min;
  final double max;

  bool canHold(double width) => width >= min && width < max;
}

extension Builder on Breakpoint {
  /// Responsive widget builder.
  ///
  /// Builds widgets based on screen size using provided breakpoints.
  /// All breakpounts are optional and can fallback to any provided breakpoint
  /// which is spaller then this (skipped) breakpoint.
  ///
  /// e.g: if no breakpoint is specified the method will show a [deviceX] layout
  /// which smallest possible breakpoint supported by this implementation.
  ///
  /// e.g (simplified): Assume that:
  /// - Current device width is large-tablet.
  /// - The provided breakpoint are small-laptop and large-mobile only.
  /// - Since no breakpoint is avaiable for large-tablet, which is currently
  ///   active breakpoint, this will return the widget provided for
  ///   large-mobile, as that is the closets one and smaller then this one.
  /// - The returned widget in above situation is scalled as per Flutter's
  ///   scalling behavior.
  /// - If the window is resized to 1px smaller them large-mobile width,
  ///   which is the only smallest avaiable breakpoint in this example,
  ///   the resulting widget will be a Placeholder() covered by tiny-mobile.
  ///
  /// Providing a widget for [smallMobile] will display that widget
  /// for any screen with `minimum_width >= 290px`.
  ///
  /// Only widget that matches the active breakpoint will get build, or any
  /// fallback in case of breakpoint is missing. So it is safe to provide
  /// all the beakpoints for any single view on the screen.
  ///
  /// TIP: Use const constructors whenever possible.
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
  ///       smallMobile: const _Widget290(),
  ///       mediumTablet: const _Widget640(),
  ///       largeTablet: const _Widget760(),
  ///       smallLaptop: const _Widget940(),
  ///     ),
  ///   );
  /// }
  /// ```
  Widget build({
    Widget? smallMobile, // mobileS: 290
    Widget? mediumMobile, // mobileM: 320
    Widget? largeMobile, // mobileL: 420
    Widget? smallTablet, // tabletS: 560
    Widget? mediumTablet, // tabletM: 640
    Widget? largeTablet, // tabletL: 760
    Widget? smallLaptop, // laptopS: 940
    Widget? mediumLaptop, // laptopM: 1080
    Widget? largeLaptop, // laptopL: 1280
    Widget? smallDesktop, // dsktopS: 1440
    Widget? mediumDesktop, // dsktopM: 1920
    Widget? largeDesktop, // dsktopL: 3840
  }) => switch (this) {
    .mobileS => smallMobile ?? _placeholder,
    .mobileM => mediumMobile ?? smallMobile ?? _placeholder,
    .mobileL => largeMobile ?? mediumMobile ?? smallMobile ?? _placeholder,
    .tabletS =>
      smallTablet ?? largeMobile ?? mediumMobile ?? smallMobile ?? _placeholder,
    .tabletM =>
      mediumTablet ??
          smallTablet ??
          largeMobile ??
          mediumMobile ??
          smallMobile ??
          _placeholder,
    .tabletL =>
      largeTablet ??
          mediumTablet ??
          smallTablet ??
          largeMobile ??
          mediumMobile ??
          smallMobile ??
          _placeholder,
    .laptopS =>
      smallLaptop ??
          largeTablet ??
          mediumTablet ??
          smallTablet ??
          largeMobile ??
          mediumMobile ??
          smallMobile ??
          _placeholder,
    .laptopM =>
      mediumLaptop ??
          smallLaptop ??
          largeTablet ??
          mediumTablet ??
          smallTablet ??
          largeMobile ??
          mediumMobile ??
          smallMobile ??
          _placeholder,
    .laptopL =>
      largeLaptop ??
          mediumLaptop ??
          smallLaptop ??
          largeTablet ??
          mediumTablet ??
          smallTablet ??
          largeMobile ??
          mediumMobile ??
          smallMobile ??
          _placeholder,
    .dsktopS =>
      smallDesktop ??
          largeLaptop ??
          mediumLaptop ??
          smallLaptop ??
          largeTablet ??
          mediumTablet ??
          smallTablet ??
          largeMobile ??
          mediumMobile ??
          smallMobile ??
          _placeholder,
    .dsktopM =>
      mediumDesktop ??
          smallDesktop ??
          largeLaptop ??
          mediumLaptop ??
          smallLaptop ??
          largeTablet ??
          mediumTablet ??
          smallTablet ??
          largeMobile ??
          mediumMobile ??
          smallMobile ??
          _placeholder,
    _ => _placeholder,
  };
}

const _placeholder = Placeholder();
