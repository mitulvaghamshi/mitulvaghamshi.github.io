import 'package:flutter/material.dart';

enum Breakpoint {
  cga(
    name: '1:CGA:w320h200:ratio16by10',
    size: Size(320, 200),
    ratio: AspectRatio.ratio16by10,
  ),

  qvga(
    name: '2:QVGA:w320h240:ratio4by3',
    size: Size(320, 240),
    ratio: AspectRatio.ratio4by3,
  ),

  varient1(
    name: '3:VGA varient 1:w480h320:ratio3by2',
    size: Size(480, 320),
    ratio: AspectRatio.ratio3by2,
  ),

  vga(
    name: '4:VGA:w640h480:ratio4by3',
    size: Size(640, 480),
    ratio: AspectRatio.ratio4by3,
  ),

  ntsc(
    name: '5:NTSC:w720h480:ratio3by2',
    size: Size(720, 480),
    ratio: AspectRatio.ratio3by2,
  ),

  varient2(
    name: '6:VGA varient 2:w768h480:ratio3by2',
    size: Size(768, 480),
    ratio: AspectRatio.ratio3by2,
  ),

  pal(
    name: '7:PAL:w768h576:ratio4by3',
    size: Size(768, 576),
    ratio: AspectRatio.ratio4by3,
  ),

  wvga(
    name: '8:WVGA:w800h480:ratio5by3',
    size: Size(800, 480),
    ratio: AspectRatio.ratio5by3,
  ),

  svga(
    name: '9:SVGA:w800h600:ratio4by3',
    size: Size(800, 600),
    ratio: AspectRatio.ratio4by3,
  ),

  fwvga(
    name: '10:FWVGA:w854h480:ratio16by9',
    size: Size(854, 480),
    ratio: AspectRatio.ratio16by9,
  ),

  varient3(
    name: '11:VGA varient 3:w960h600:ratio16by10',
    size: Size(960, 600),
    ratio: AspectRatio.ratio16by10,
  ),

  varient4(
    name: '12:VGA varient 4:w960h640:ratio3by2',
    size: Size(960, 640),
    ratio: AspectRatio.ratio3by2,
  ),

  wsvga(
    name: '13:WSVGA:w1024h600:ratio5by3',
    size: Size(1024, 600),
    ratio: AspectRatio.ratio5by3,
  ),

  varient5(
    name: '14:VGA varient 5:w1024h720:ratio7by5',
    size: Size(1024, 720),
    ratio: AspectRatio.ratio7by5,
  ),

  xga(
    name: '15:XGA:w1024h768:ratio4by3',
    size: Size(1024, 768),
    ratio: AspectRatio.ratio4by3,
  ),

  varient6(
    name: '16:VGA varient 6:w1152h720:ratio16by10',
    size: Size(1152, 720),
    ratio: AspectRatio.ratio16by10,
  ),

  varient7(
    name: '17:VGA varient 7:w1125h768:ratio3by2',
    size: Size(1125, 768),
    ratio: AspectRatio.ratio3by2,
  ),

  hd720(
    name: '18:HD 720:w1280h720:ratio16by9',
    size: Size(1280, 720),
    ratio: AspectRatio.ratio16by9,
  ),

  wxga(
    name: '19:WXGA:w1280h768:ratio5by3',
    size: Size(1280, 768),
    ratio: AspectRatio.ratio5by3,
  ),

  varient8(
    name: '20:VGA varient 8:w1280h800:ratio16by10',
    size: Size(1280, 800),
    ratio: AspectRatio.ratio16by10,
  ),

  varient9(
    name: '21:VGA varient 9:w1280h854:ratio3by2',
    size: Size(1280, 854),
    ratio: AspectRatio.ratio3by2,
  ),

  varient10(
    name: '22:VGA varient 10:w1280h900:ratio7by5',
    size: Size(1280, 900),
    ratio: AspectRatio.ratio7by5,
  ),

  varient11(
    name: '23:VGA varient 11:w1280h960:ratio4by3',
    size: Size(1280, 960),
    ratio: AspectRatio.ratio4by3,
  ),

  sxga(
    name: '24:SXGA:w1280h1024:ratio5by4',
    size: Size(1280, 1024),
    ratio: AspectRatio.ratio5by4,
  ),

  varient12(
    name: '25:VGA varient 12:w1366h768:ratio16by9',
    size: Size(1366, 768),
    ratio: AspectRatio.ratio16by9,
  ),

  varient13(
    name: '26:VGA varient 13:w1400h900:ratio14by9',
    size: Size(1400, 900),
    ratio: AspectRatio.ratio14by9,
  ),

  varient14(
    name: '27:VGA varient 14:w1400h960:ratio7by5',
    size: Size(1400, 960),
    ratio: AspectRatio.ratio7by5,
  ),

  sxgaPlus(
    name: '28:SXGA+:w1400h1050:ratio4by3',
    size: Size(1400, 1050),
    ratio: AspectRatio.ratio4by3,
  ),

  varient15(
    name: '29:VGA varient 15:w1440h900:ratio16by10',
    size: Size(1440, 900),
    ratio: AspectRatio.ratio16by10,
  ),

  varient16(
    name: '30:VGA varient 16:w1440h960:ratio3by2',
    size: Size(1440, 960),
    ratio: AspectRatio.ratio3by2,
  ),

  varient17(
    name: '31:VGA varient 17:w1600h1050:ratio7by5',
    size: Size(1600, 1050),
    ratio: AspectRatio.ratio7by5,
  ),

  varient18(
    name: '32:VGA varient 18:w1600h1080:ratio5by3',
    size: Size(1600, 1080),
    ratio: AspectRatio.ratio5by3,
  ),

  usxga(
    name: '33:UXGA:w1600h1200:ratio4by3',
    size: Size(1600, 1200),
    ratio: AspectRatio.ratio4by3,
  ),

  wsxgaPlus(
    name: '34:WSXGA+:w1680h1050:ratio16by10',
    size: Size(1680, 1050),
    ratio: AspectRatio.ratio16by10,
  ),

  hd1080(
    name: '35:HD 1080:w1920h1080:ratio16by9',
    size: Size(1920, 1080),
    ratio: AspectRatio.ratio16by9,
  ),

  wuxga(
    name: '36:WUXGA:w1920h1200:ratio16by10',
    size: Size(1920, 1200),
    ratio: AspectRatio.ratio16by10,
  ),

  hd2k(
    name: '37:2K:w2048h1080:ratio17by9',
    size: Size(2048, 1080),
    ratio: AspectRatio.ratio17by9,
  ),

  qxga(
    name: '38:QXGA:w2048h1536:ratio4by3',
    size: Size(2048, 1536),
    ratio: AspectRatio.ratio4by3,
  ),

  wqxga(
    name: '39:WQXGA:w2560h1600:ratio16by10',
    size: Size(2560, 1600),
    ratio: AspectRatio.ratio16by10,
  ),

  qsxga(
    name: '40:QSQGA:w2560h2048:ratio5by4',
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

  const AspectRatio(this.ratio);

  final double ratio;
}
