import 'package:flutter/material.dart';
import 'package:theme_extension/theme_extension.dart';

part 'app_colors.g.dart';

@immutable
@colorConfig
class AppColors {
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

// const cardDark = Color(0xFF202A34);
// const containerDark = Color(0xFF151921);

// interface class SampleLightColors {
//   static const blackLight = Color(0xFF8F959B);
//   static const whiteLight = Color(0xFFF6F9FA);
//   static const redLight = Color(0xFFF4A59E);
//   static const greenLight = Color(0xFF7DFFBD);
//   static const blueLight = Color(0xFFA6C4F8);
//   static const pinkLight = Color(0xFFF2ADF7);
//   static const cyanLight = Color(0xFF75F8F9);
//   static const orangeLight = Color(0xFFF6D059);
// }

// interface class SampleDarkColors {
//   static const blackDark = Color(0xFF343739);
//   static const whiteDark = Color(0xFFFFFFFF);
//   static const redDark = Color(0xFFF18075);
//   static const greenDark = Color(0xFF20694C);
//   static const blueDark = Color(0xFF7EABF6);
//   static const pinkDark = Color(0xFFE953F6);
//   static const cyanDark = Color(0xFF3FB7BF);
//   static const orangeDark = Color(0xFFDF6902);
// }
