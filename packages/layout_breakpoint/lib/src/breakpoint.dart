import 'package:flutter/material.dart';

enum AspectRatio {
  ratio3by2(aspectRatio: 3 / 2),
  ratio7by5(aspectRatio: 7 / 5),
  ratio4by3(aspectRatio: 4 / 3),
  ratio5by3(aspectRatio: 5 / 3),
  ratio5by4(aspectRatio: 5 / 4),
  ratio14by9(aspectRatio: 14 / 9),
  ratio16by9(aspectRatio: 16 / 9),
  ratio16by10(aspectRatio: 16 / 10),
  ratio17by9(aspectRatio: 17 / 9),
  ;

  const AspectRatio({required this.aspectRatio});

  final double aspectRatio;
}

@immutable
class Breakpoint {
  const Breakpoint({
    required this.index,
    required this.name,
    required this.width,
    required this.height,
    required this.ratio,
  });

  final int index;
  final String name;
  final double width;
  final double height;
  final AspectRatio ratio;
}

@immutable
class Breakpoints {
  static const cga = Breakpoint(
    index: 1,
    name: 'CGA',
    width: 320,
    height: 200,
    ratio: AspectRatio.ratio16by10,
  );

  static const qvga = Breakpoint(
    index: 2,
    name: 'QVGA',
    width: 320,
    height: 240,
    ratio: AspectRatio.ratio4by3,
  );

  static const varient1 = Breakpoint(
    index: 3,
    name: 'VGA Varient 1',
    width: 480,
    height: 320,
    ratio: AspectRatio.ratio3by2,
  );

  static const vga = Breakpoint(
    index: 4,
    name: 'VGA',
    width: 640,
    height: 480,
    ratio: AspectRatio.ratio4by3,
  );

  static const ntsc = Breakpoint(
    index: 5,
    name: 'NTSC',
    width: 720,
    height: 480,
    ratio: AspectRatio.ratio3by2,
  );

  static const varient2 = Breakpoint(
    index: 6,
    name: 'VGA Varient 2',
    width: 768,
    height: 480,
    ratio: AspectRatio.ratio3by2,
  );

  static const pal = Breakpoint(
    index: 7,
    name: 'PAL',
    width: 768,
    height: 576,
    ratio: AspectRatio.ratio4by3,
  );

  static const wvga = Breakpoint(
    index: 8,
    name: 'WVGA',
    width: 800,
    height: 480,
    ratio: AspectRatio.ratio5by3,
  );

  static const svga = Breakpoint(
    index: 9,
    name: 'SVGA',
    width: 800,
    height: 600,
    ratio: AspectRatio.ratio4by3,
  );

  static const fwvga = Breakpoint(
    index: 10,
    name: 'FWVGA',
    width: 854,
    height: 480,
    ratio: AspectRatio.ratio16by9,
  );

  static const varient3 = Breakpoint(
    index: 11,
    name: 'VGA Varient 3',
    width: 960,
    height: 600,
    ratio: AspectRatio.ratio16by10,
  );

  static const varient4 = Breakpoint(
    index: 12,
    name: 'VGA Varient 4',
    width: 960,
    height: 640,
    ratio: AspectRatio.ratio3by2,
  );

  static const wsvga = Breakpoint(
    index: 13,
    name: 'WSVGA',
    width: 1024,
    height: 600,
    ratio: AspectRatio.ratio5by3,
  );

  static const varient5 = Breakpoint(
    index: 14,
    name: 'VGA Varient 5',
    width: 1024,
    height: 720,
    ratio: AspectRatio.ratio7by5,
  );

  static const xga = Breakpoint(
    index: 15,
    name: 'XGA',
    width: 1024,
    height: 768,
    ratio: AspectRatio.ratio4by3,
  );

  static const varient6 = Breakpoint(
    index: 16,
    name: 'VGA Varient 6',
    width: 1152,
    height: 720,
    ratio: AspectRatio.ratio16by10,
  );

  static const varient7 = Breakpoint(
    index: 17,
    name: 'VGA Varient 7',
    width: 1125,
    height: 768,
    ratio: AspectRatio.ratio3by2,
  );

  static const hd720 = Breakpoint(
    index: 18,
    name: 'HD 720',
    width: 1280,
    height: 720,
    ratio: AspectRatio.ratio16by9,
  );

  static const wxga = Breakpoint(
    index: 19,
    name: 'WXGA',
    width: 1280,
    height: 768,
    ratio: AspectRatio.ratio5by3,
  );

  static const varient8 = Breakpoint(
    index: 20,
    name: 'VGA Varient 8',
    width: 1280,
    height: 800,
    ratio: AspectRatio.ratio16by10,
  );

  static const varient9 = Breakpoint(
    index: 21,
    name: 'VGA Varient 9',
    width: 1280,
    height: 854,
    ratio: AspectRatio.ratio3by2,
  );

  static const varient10 = Breakpoint(
    index: 22,
    name: 'VGA Varient 10',
    width: 1280,
    height: 900,
    ratio: AspectRatio.ratio7by5,
  );

  static const varient11 = Breakpoint(
    index: 23,
    name: 'VGA Varient 11',
    width: 1280,
    height: 960,
    ratio: AspectRatio.ratio4by3,
  );

  static const sxga = Breakpoint(
    index: 24,
    name: 'SXGA',
    width: 1280,
    height: 1024,
    ratio: AspectRatio.ratio5by4,
  );

  static const varient12 = Breakpoint(
    index: 25,
    name: 'VGA Varient 12',
    width: 1366,
    height: 768,
    ratio: AspectRatio.ratio16by9,
  );

  static const varient13 = Breakpoint(
    index: 26,
    name: 'VGA Varient 13',
    width: 1400,
    height: 900,
    ratio: AspectRatio.ratio14by9,
  );

  static const varient14 = Breakpoint(
    index: 27,
    name: 'VGA Varient 14',
    width: 1400,
    height: 960,
    ratio: AspectRatio.ratio7by5,
  );

  static const sxgaPlus = Breakpoint(
    index: 28,
    name: 'SXGA+',
    width: 1400,
    height: 1050,
    ratio: AspectRatio.ratio4by3,
  );

  static const varient15 = Breakpoint(
    index: 29,
    name: 'VGA Varient 15',
    width: 1440,
    height: 900,
    ratio: AspectRatio.ratio16by10,
  );

  static const varient16 = Breakpoint(
    index: 30,
    name: 'VGA Varient 16',
    width: 1440,
    height: 960,
    ratio: AspectRatio.ratio3by2,
  );

  static const varient17 = Breakpoint(
    index: 31,
    name: 'VGA Varient 17',
    width: 1600,
    height: 1050,
    ratio: AspectRatio.ratio7by5,
  );

  static const varient18 = Breakpoint(
    index: 32,
    name: 'VGA Varient 18',
    width: 1600,
    height: 1080,
    ratio: AspectRatio.ratio5by3,
  );

  static const usxga = Breakpoint(
    index: 33,
    name: 'UXGA',
    width: 1600,
    height: 1200,
    ratio: AspectRatio.ratio4by3,
  );

  static const wsxgaPlus = Breakpoint(
    index: 34,
    name: 'WSXGA+',
    width: 1680,
    height: 1050,
    ratio: AspectRatio.ratio16by10,
  );

  static const hd1080 = Breakpoint(
    index: 35,
    name: 'HD 1080',
    width: 1920,
    height: 1080,
    ratio: AspectRatio.ratio16by9,
  );

  static const wuxga = Breakpoint(
    index: 36,
    name: 'WUXGA',
    width: 1920,
    height: 1200,
    ratio: AspectRatio.ratio16by10,
  );

  static const hd2k = Breakpoint(
    index: 37,
    name: '2K',
    width: 2048,
    height: 1080,
    ratio: AspectRatio.ratio17by9,
  );

  static const qxga = Breakpoint(
    index: 38,
    name: 'QXGA',
    width: 2048,
    height: 1536,
    ratio: AspectRatio.ratio4by3,
  );

  static const wqxga = Breakpoint(
    index: 39,
    name: 'WQXGA',
    width: 2560,
    height: 1600,
    ratio: AspectRatio.ratio16by10,
  );

  static const qsxga = Breakpoint(
    index: 40,
    name: 'QSQGA',
    width: 2560,
    height: 2048,
    ratio: AspectRatio.ratio5by4,
  );
}
