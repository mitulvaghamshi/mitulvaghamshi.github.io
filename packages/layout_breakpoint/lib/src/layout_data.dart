import 'package:flutter/material.dart';

@immutable
class LayoutData {
  const LayoutData({
    required this.dp,
    required this.minWidth,
    required this.maxWidth,
  });

  final double dp;
  final double minWidth;
  final double maxWidth;

  bool isWithin(final double width) => width >= minWidth && width < maxWidth;

  // bool isWithin2(final double width) => width >= minWidth && width <= maxWidth;
}

// const mobileData = LayoutData(dp: 12, minWidth: 0, maxWidth: 480);
// const tabletData = LayoutData(dp: 12, minWidth: 481, maxWidth: 768);
// const laptopData = LayoutData(dp: 12, minWidth: 769, maxWidth: 1279);
// const desktopData = LayoutData(dp: 12, minWidth: 1280, maxWidth: 1440);

const tinyMobile = LayoutData(dp: 12, minWidth: 0, maxWidth: 290);
const smallMobile = LayoutData(dp: 14, minWidth: 290, maxWidth: 320);
const mediumMobile = LayoutData(dp: 14, minWidth: 320, maxWidth: 420);
const largeMobile = LayoutData(dp: 16, minWidth: 420, maxWidth: 560);
const smallTablet = LayoutData(dp: 18, minWidth: 560, maxWidth: 640);
const mediumTablet = LayoutData(dp: 18, minWidth: 640, maxWidth: 760);
const largeTablet = LayoutData(dp: 18, minWidth: 760, maxWidth: 940);
const smallLaptop = LayoutData(dp: 18, minWidth: 940, maxWidth: 1080);
const mediumLaptop = LayoutData(dp: 18, minWidth: 1080, maxWidth: 1280);
const largeLaptop = LayoutData(dp: 18, minWidth: 1280, maxWidth: 1440);
const desktop_2k = LayoutData(dp: 20, minWidth: 1440, maxWidth: 1920);
const desktop_4k = LayoutData(dp: 20, minWidth: 1920, maxWidth: 3840);
