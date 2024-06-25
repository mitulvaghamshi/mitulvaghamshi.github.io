import 'package:flutter/material.dart';

enum Breakpoint {
  cga(
    name: '1:CGA',
    size: Size(320, 200),
    ratio: AspectRatio.ratio16by10,
  ),

  qvga(
    name: '2:QVGA',
    size: Size(320, 240),
    ratio: AspectRatio.ratio4by3,
  ),

  varient1(
    name: '3:VGA Varient 1',
    size: Size(480, 320),
    ratio: AspectRatio.ratio3by2,
  ),

  vga(
    name: '4:VGA',
    size: Size(640, 480),
    ratio: AspectRatio.ratio4by3,
  ),

  ntsc(
    name: '5:NTSC',
    size: Size(720, 480),
    ratio: AspectRatio.ratio3by2,
  ),

  varient2(
    name: '6:VGA Varient 2',
    size: Size(768, 480),
    ratio: AspectRatio.ratio3by2,
  ),

  pal(
    name: '7:PAL',
    size: Size(768, 576),
    ratio: AspectRatio.ratio4by3,
  ),

  wvga(
    name: '8:WVGA',
    size: Size(800, 480),
    ratio: AspectRatio.ratio5by3,
  ),

  svga(
    name: '9:SVGA',
    size: Size(800, 600),
    ratio: AspectRatio.ratio4by3,
  ),

  fwvga(
    name: '10:FWVGA',
    size: Size(854, 480),
    ratio: AspectRatio.ratio16by9,
  ),

  varient3(
    name: '11:VGA Varient 3',
    size: Size(960, 600),
    ratio: AspectRatio.ratio16by10,
  ),

  varient4(
    name: '12:VGA Varient 4',
    size: Size(960, 640),
    ratio: AspectRatio.ratio3by2,
  ),

  wsvga(
    name: '13:WSVGA',
    size: Size(1024, 600),
    ratio: AspectRatio.ratio5by3,
  ),

  varient5(
    name: '14:VGA Varient 5',
    size: Size(1024, 720),
    ratio: AspectRatio.ratio7by5,
  ),

  xga(
    name: '15:XGA',
    size: Size(1024, 768),
    ratio: AspectRatio.ratio4by3,
  ),

  varient6(
    name: '16:VGA Varient 6',
    size: Size(1152, 720),
    ratio: AspectRatio.ratio16by10,
  ),

  varient7(
    name: '17:VGA Varient 7',
    size: Size(1125, 768),
    ratio: AspectRatio.ratio3by2,
  ),

  hd720(
    name: '18:HD 720',
    size: Size(1280, 720),
    ratio: AspectRatio.ratio16by9,
  ),

  wxga(
    name: '19:WXGA',
    size: Size(1280, 768),
    ratio: AspectRatio.ratio5by3,
  ),

  varient8(
    name: '20:VGA Varient 8',
    size: Size(1280, 800),
    ratio: AspectRatio.ratio16by10,
  ),

  varient9(
    name: '21:VGA Varient 9',
    size: Size(1280, 854),
    ratio: AspectRatio.ratio3by2,
  ),

  varient10(
    name: '22:VGA Varient 10',
    size: Size(1280, 900),
    ratio: AspectRatio.ratio7by5,
  ),

  varient11(
    name: '23:VGA Varient 11',
    size: Size(1280, 960),
    ratio: AspectRatio.ratio4by3,
  ),

  sxga(
    name: '24:SXGA',
    size: Size(1280, 1024),
    ratio: AspectRatio.ratio5by4,
  ),

  varient12(
    name: '25:VGA Varient 12',
    size: Size(1366, 768),
    ratio: AspectRatio.ratio16by9,
  ),

  varient13(
    name: '26:VGA Varient 13',
    size: Size(1400, 900),
    ratio: AspectRatio.ratio14by9,
  ),

  varient14(
    name: '27:VGA Varient 14',
    size: Size(1400, 960),
    ratio: AspectRatio.ratio7by5,
  ),

  sxgaPlus(
    name: '28:SXGA+',
    size: Size(1400, 1050),
    ratio: AspectRatio.ratio4by3,
  ),

  varient15(
    name: '29:VGA Varient 15',
    size: Size(1440, 900),
    ratio: AspectRatio.ratio16by10,
  ),

  varient16(
    name: '30:VGA Varient 16',
    size: Size(1440, 960),
    ratio: AspectRatio.ratio3by2,
  ),

  varient17(
    name: '31:VGA Varient 17',
    size: Size(1600, 1050),
    ratio: AspectRatio.ratio7by5,
  ),

  varient18(
    name: '32:VGA Varient 18',
    size: Size(1600, 1080),
    ratio: AspectRatio.ratio5by3,
  ),

  usxga(
    name: '33:UXGA',
    size: Size(1600, 1200),
    ratio: AspectRatio.ratio4by3,
  ),

  wsxgaPlus(
    name: '34:WSXGA+',
    size: Size(1680, 1050),
    ratio: AspectRatio.ratio16by10,
  ),

  hd1080(
    name: '35:HD 1080',
    size: Size(1920, 1080),
    ratio: AspectRatio.ratio16by9,
  ),

  wuxga(
    name: '36:WUXGA',
    size: Size(1920, 1200),
    ratio: AspectRatio.ratio16by10,
  ),

  hd2k(
    name: '37:2K',
    size: Size(2048, 1080),
    ratio: AspectRatio.ratio17by9,
  ),

  qxga(
    name: '38:QXGA',
    size: Size(2048, 1536),
    ratio: AspectRatio.ratio4by3,
  ),

  wqxga(
    name: '39:WQXGA',
    size: Size(2560, 1600),
    ratio: AspectRatio.ratio16by10,
  ),

  qsxga(
    name: '40:QSQGA',
    size: Size(2560, 2048),
    ratio: AspectRatio.ratio5by4,
  ),
  ;

  const Breakpoint({
    required this.name,
    required this.size,
    required this.ratio,
  });

  final String name;
  final Size size;
  final AspectRatio ratio;
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

  const AspectRatio(this.aspectRatio);

  final double aspectRatio;
}
