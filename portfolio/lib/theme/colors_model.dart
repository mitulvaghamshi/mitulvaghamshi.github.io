import 'package:flutter/material.dart';
import 'package:theme_extension/theme_extension.dart';

part 'colors_model.g.dart';

@immutable
@colorconfig
interface class ColorsModel {
  const ColorsModel();

  // Theme Button
  static const themeButton = (Color(0xFF000B37), Color(0xFFFF5500));

  // Profile Picture
  static const imageBlend = (Color(0x00000000), Color(0x50FFFFFF));

  // Intro Card
  static const introContainer = (Color(0xFFE3FFDE), Color(0xFF0A0F16));
  static const introCard = (Color(0xFFCCFFBA), Color(0xFF15202B));
  static const introText = (Color(0xFF19364B), Color(0xFFE4E5E9));

  // Repo Card
  static const repoContainer = (Color(0xFFDEE2FF), Color(0xFF0A0F16));
  static const repoCard = (Color(0xFFC2C8FF), Color(0xFF15202B));
  static const repoTitle = (Color(0xFF001B7D), Color(0xFFE4E5E9));
  static const repoSubtitle = (Color(0xFF005488), Color(0xFFE4E5E9));
  static const repoText = (Color(0xFF19364B), Color(0xFFE4E5E9));

  // Edu Card
  static const eduContainer = (Color(0xFFFCDEFF), Color(0xFF0A0F16));
  static const eduCard = (Color(0xFFF3B6FE), Color(0xFF15202B));
  static const eduTitle = (Color(0xFF7D004D), Color(0xFFE4E5E9));
  static const eduSubtitle = (Color(0xFF880086), Color(0xFFE4E5E9));
  static const eduText = (Color(0xFF81225C), Color(0xFFE4E5E9));

  // Wes Card
  static const wesContainer = (Color(0xFFFFF4DE), Color(0xFF0A0F16));
  static const wesCard = (Color(0xFFFFEDBF), Color(0xFF15202B));
  static const wesTitle = (Color(0xFFFFDC85), Color(0xFF0A0F16));
  static const wesText = (Color(0xFF19364B), Color(0xFFE4E5E9));

  // About Card
  static const aboutContainer = (Color(0xFFDBF2FF), Color(0xFF0A0F16));
  static const aboutCard = (Color(0xFFBAE5FF), Color(0xFF15202B));
  static const aboutText = (Color(0xFF19364B), Color(0xFFE4E5E9));
}

mixin ColorSet1 {
  static const black = (Color(0xFF8F959B), Color(0xFF343739));
  static const white = (Color(0xFFF6F9FA), Color(0xFFFFFFFF));
  static const red = (Color(0xFFF4A59E), Color(0xFFF18075));
  static const green = (Color(0xFF7DFFBD), Color(0xFF20694C));
  static const blue = (Color(0xFFA6C4F8), Color(0xFF7EABF6));
  static const pink = (Color(0xFFF2ADF7), Color(0xFFE953F6));
  static const cyan = (Color(0xFF75F8F9), Color(0xFF3FB7BF));
  static const orange = (Color(0xFFF6D059), Color(0xFFDF6902));
}

mixin ColorSet2 {
  static const cardDark = Color(0xFF202A34);
  static const containerDark = Color(0xFF151921);

  static const containerBlue = Color(0xffebf5fe);
  static const buttonBlue = Color(0xff41a1f0);
  static const buttonBlueLight = Color(0x8041A1F0);

  static const containerOrange = Color(0xfffff2eb);
  static const buttonOrange = Color(0xffff7c3f);
  static const buttonOrangeLight = Color(0x80ff7c3f);

  static const bontainerGreen = Color(0xffe9f9f0);
  static const buttonGreen = Color(0xff2ebf6d);
  static const buttonGreenLight = Color(0x802ebf6d);
}
