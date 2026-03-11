// ignore_for_file: constant_identifier_names

enum AspectRatio {
  ratio3by2__(03, 02), // 1.50
  ratio7by5__(07, 05), // 1.40
  ratio4by3__(04, 03), // 1.33
  ratio5by3__(05, 03), // 1.67
  ratio5by4__(05, 04), // 1.25
  ratio14by9_(14, 09), // 1.56
  ratio16by9_(16, 09), // 1.78
  ratio16by10(16, 10), // 1.60
  ratio17by9_(17, 09); // 1.89

  const AspectRatio(this.wf, this.hf);

  final int wf;
  final int hf;

  double get value => wf / hf;
}

enum DisplaySize {
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

  const DisplaySize(this.width, this.height, this.ratio);

  final int width;
  final int height;
  final AspectRatio ratio;
}
