import 'package:flutter/material.dart';

enum Breakpoint {
  cga(name: 'CGA', size: Size(320, 200), ratio: .ratio16by10),
  qvga(name: 'QVGA', size: Size(320, 240), ratio: .ratio4by3),
  varient1(name: 'VGA1', size: Size(480, 320), ratio: .ratio3by2),
  vga(name: 'VGA', size: Size(640, 480), ratio: .ratio4by3),
  ntsc(name: 'NTSC', size: Size(720, 480), ratio: .ratio3by2),
  varient2(name: 'VGA2', size: Size(768, 480), ratio: .ratio3by2),
  pal(name: 'PAL', size: Size(768, 576), ratio: .ratio4by3),
  wvga(name: 'WVGA', size: Size(800, 480), ratio: .ratio5by3),
  svga(name: 'SVGA', size: Size(800, 600), ratio: .ratio4by3),
  fwvga(name: 'FWVGA', size: Size(854, 480), ratio: .ratio16by9),
  varient3(name: 'VGA3', size: Size(960, 600), ratio: .ratio16by10),
  varient4(name: 'VGA4', size: Size(960, 640), ratio: .ratio3by2),
  wsvga(name: 'WSVGA', size: Size(1024, 600), ratio: .ratio5by3),
  varient5(name: 'VGA5', size: Size(1024, 720), ratio: .ratio7by5),
  xga(name: 'XGA', size: Size(1024, 768), ratio: .ratio4by3),
  varient6(name: 'VGA6', size: Size(1152, 720), ratio: .ratio16by10),
  varient7(name: 'VGA7', size: Size(1125, 768), ratio: .ratio3by2),
  hd720(name: 'HD720', size: Size(1280, 720), ratio: .ratio16by9),
  wxga(name: 'WXGA', size: Size(1280, 768), ratio: .ratio5by3),
  varient8(name: 'VGA8', size: Size(1280, 800), ratio: .ratio16by10),
  varient9(name: 'VGA9', size: Size(1280, 854), ratio: .ratio3by2),
  varient10(name: 'VGA10', size: Size(1280, 900), ratio: .ratio7by5),
  varient11(name: 'VGA11', size: Size(1280, 960), ratio: .ratio4by3),
  sxga(name: 'SXGA', size: Size(1280, 1024), ratio: .ratio5by4),
  varient12(name: 'VGA12', size: Size(1366, 768), ratio: .ratio16by9),
  varient13(name: 'VGA13', size: Size(1400, 900), ratio: .ratio14by9),
  varient14(name: 'VGA14', size: Size(1400, 960), ratio: .ratio7by5),
  sxgaPlus(name: 'SXGA+', size: Size(1400, 1050), ratio: .ratio4by3),
  varient15(name: 'VGA15', size: Size(1440, 900), ratio: .ratio16by10),
  varient16(name: 'VGA16', size: Size(1440, 960), ratio: .ratio3by2),
  varient17(name: 'VGA17', size: Size(1600, 1050), ratio: .ratio7by5),
  varient18(name: 'VGA18', size: Size(1600, 1080), ratio: .ratio5by3),
  usxga(name: 'UXGA', size: Size(1600, 1200), ratio: .ratio4by3),
  wsxgaPlus(name: 'WSXGA+', size: Size(1680, 1050), ratio: .ratio16by10),
  hd1080(name: 'HD1080', size: Size(1920, 1080), ratio: .ratio16by9),
  wuxga(name: 'WUXGA', size: Size(1920, 1200), ratio: .ratio16by10),
  hd2k(name: '2K', size: Size(2048, 1080), ratio: .ratio17by9),
  qxga(name: 'QXGA', size: Size(2048, 1536), ratio: .ratio4by3),
  wqxga(name: 'WQXGA', size: Size(2560, 1600), ratio: .ratio16by10),
  qsxga(name: 'QSQGA', size: Size(2560, 2048), ratio: .ratio5by4);

  const Breakpoint({
    required this.name,
    required this.size,
    required this.ratio,
  });

  final String name;
  final Size size;
  final AspectRatio ratio;

  @override
  String toString() =>
      '#${index + 1}:$name:'
      'W${size.width}:H${size.height}:'
      'A${ratio.ratio}';
}

enum AspectRatio {
  ratio3by2(3 / 2),
  ratio7by5(7 / 5),
  ratio4by3(4 / 3),
  ratio5by3(5 / 3),
  ratio5by4(5 / 4),
  ratio14by9(14 / 9),
  ratio16by9(16 / 9),
  ratio16by10(16 / 10),
  ratio17by9(17 / 9);

  const AspectRatio(this.ratio);

  final double ratio;
}
