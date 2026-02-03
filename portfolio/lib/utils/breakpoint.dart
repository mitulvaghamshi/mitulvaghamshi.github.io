// ignore_for_file: constant_identifier_names

enum Ratio {
  ratio3by2__(03 / 02),
  ratio7by5__(07 / 05),
  ratio4by3__(04 / 03),
  ratio5by3__(05 / 03),
  ratio5by4__(05 / 04),
  ratio14by9_(14 / 09),
  ratio16by9_(16 / 09),
  ratio16by10(16 / 10),
  ratio17by9_(17 / 09);

  const Ratio(this.value);

  final double value;
}

enum Breakpoint {
  cga______(0320, 0200, .ratio16by10),
  qvga_____(0320, 0240, .ratio4by3__),
  varient1_(0480, 0320, .ratio3by2__),
  vga______(0640, 0480, .ratio4by3__),
  ntsc_____(0720, 0480, .ratio3by2__),
  varient2_(0768, 0480, .ratio3by2__),
  pal______(0768, 0576, .ratio4by3__),
  wvga_____(0800, 0480, .ratio5by3__),
  svga_____(0800, 0600, .ratio4by3__),
  fwvga____(0854, 0480, .ratio16by9_),
  varient3_(0960, 0600, .ratio16by10),
  varient4_(0960, 0640, .ratio3by2__),
  wsvga____(1024, 0600, .ratio5by3__),
  varient5_(1024, 0720, .ratio7by5__),
  xga______(1024, 0768, .ratio4by3__),
  varient6_(1152, 0720, .ratio16by10),
  varient7_(1125, 0768, .ratio3by2__),
  hd720____(1280, 0720, .ratio16by9_),
  wxga_____(1280, 0768, .ratio5by3__),
  varient8_(1280, 0800, .ratio16by10),
  varient9_(1280, 0854, .ratio3by2__),
  varient10(1280, 0900, .ratio7by5__),
  varient11(1280, 0960, .ratio4by3__),
  sxga_____(1280, 1024, .ratio5by4__),
  varient12(1366, 0768, .ratio16by9_),
  varient13(1400, 0900, .ratio14by9_),
  varient14(1400, 0960, .ratio7by5__),
  sxgaPlus_(1400, 1050, .ratio4by3__),
  varient15(1440, 0900, .ratio16by10),
  varient16(1440, 0960, .ratio3by2__),
  varient17(1600, 1050, .ratio7by5__),
  varient18(1600, 1080, .ratio5by3__),
  usxga____(1600, 1200, .ratio4by3__),
  wsxgaPlus(1680, 1050, .ratio16by10),
  hd1080___(1920, 1080, .ratio16by9_),
  wuxga____(1920, 1200, .ratio16by10),
  hd2k_____(2048, 1080, .ratio17by9_),
  qxga_____(2048, 1536, .ratio4by3__),
  wqxga____(2560, 1600, .ratio16by10),
  qsxga____(2560, 2048, .ratio5by4__);

  const Breakpoint(this.width, this.height, this.ratio);

  final int width;
  final int height;
  final Ratio ratio;
}

// Layout Breakpoints
//
// | No. | Name       | Size(w, h)   | Ratio   | Value |
// | --- | ---------- | ------------ | ------- | ----- |
// | 1   | CGA        | (320, 200)   | 16 / 10 | 1.60  |
// | 2   | QVGA       | (320, 240)   | 4 / 3   | 1.33  |
// | 3   | Varient 1  | (480, 320)   | 3 / 2   | 1.50  |
// | 4   | VGA        | (640, 480)   | 4 / 3   | 1.33  |
// | 5   | NTSC       | (720, 480)   | 3 / 2   | 1.50  |
// | 6   | Varient 2  | (768, 480)   | 3 / 2   | 1.50  |
// | 7   | PAL        | (768, 576)   | 4 / 3   | 1.33  |
// | 8   | WVGA       | (800, 480)   | 5 / 3   | 1.67  |
// | 9   | SVGA       | (800, 600)   | 4 / 3   | 1.33  |
// | 10  | FWVGA      | (854, 480)   | 16 / 9  | 1.78  |
// | 11  | Varient 3  | (960, 600)   | 16 / 10 | 1.60  |
// | 12  | Varient 4  | (960, 640)   | 3 / 2   | 1.50  |
// | 13  | WSVGA      | (1024, 600)  | 5 / 3   | 1.67  |
// | 14  | Varient 5  | (1024, 720)  | 7 / 5   | 1.40  |
// | 15  | XGA        | (1024, 768)  | 4 / 3   | 1.33  |
// | 16  | Varient 6  | (1152, 720)  | 16 / 10 | 1.60  |
// | 17  | Varient 7  | (1125, 768)  | 3 / 2   | 1.50  |
// | 18  | HD 720     | (1280, 720)  | 16 / 9  | 1.78  |
// | 19  | WXGA       | (1280, 768)  | 5 / 3   | 1.67  |
// | 20  | Varient 8  | (1280, 800)  | 16 / 10 | 1.60  |
// | 21  | Varient 9  | (1280, 854)  | 3 / 2   | 1.50  |
// | 22  | Varient 10 | (1280, 900)  | 7 / 5   | 1.40  |
// | 23  | Varient 11 | (1280, 960)  | 4 / 3   | 1.33  |
// | 24  | SXGA       | (1280, 1024) | 5 / 4   | 1.25  |
// | 25  | Varient 12 | (1366, 768)  | 16 / 9  | 1.78  |
// | 26  | Varient 13 | (1400, 900)  | 14 / 9  | 1.56  |
// | 27  | Varient 14 | (1400, 960)  | 7 / 5   | 1.40  |
// | 28  | SXGA+      | (1400, 1050) | 4 / 3   | 1.33  |
// | 29  | Varient 15 | (1440, 900)  | 16 / 10 | 1.60  |
// | 30  | Varient 16 | (1440, 960)  | 3 / 2   | 1.50  |
// | 31  | Varient 17 | (1600, 1050) | 7 / 5   | 1.40  |
// | 32  | Varient 18 | (1600, 1080) | 5 / 3   | 1.67  |
// | 33  | UXGA       | (1600, 1200) | 4 / 3   | 1.33  |
// | 34  | WSXGA+     | (1680, 1050) | 16 / 10 | 1.60  |
// | 35  | HD 1080    | (1920, 1080) | 16 / 9  | 1.78  |
// | 36  | WUXGA      | (1920, 1200) | 16 / 10 | 1.60  |
// | 37  | 2K         | (2048, 1080) | 17 / 9  | 1.89  |
// | 38  | QXGA       | (2048, 1536) | 4 / 3   | 1.33  |
// | 39  | WQXGA      | (2560, 1600) | 16 / 10 | 1.60  |
// | 40  | QSQGA      | (2560, 2048) | 5 / 4   | 1.25  |
