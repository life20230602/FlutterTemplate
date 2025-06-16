import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/res/themes.dart';

///黑绿色主题实现
class AppGreenThemeImpl extends AppTheme {
  BuildContext context;

  AppGreenThemeImpl({required this.context});

  @override
  Color get primary => const Color(0xFF00D542);
  @override
  Color get secondPrimary => const Color(0xFF00DF39);

  @override
  Color get titleTextColor => Colors.white;

  @override
  Color get appGrey => const Color(0xFFA09F9F);

  @override
  Color get titleBackground => Colors.black;

  @override
  Color get appButtonTextColor => Colors.black;

  @override
  Color get appButtonBackgroundColor => const Color(0xFF007AFF);

  @override
  Color get appButtonBackgroundPressedColor => const Color(0xFF2f51cc);

  @override
  Color get appBackground => Colors.black;

  @override
  Color get blackColor => Colors.black;

  @override
  Color get secondTextColor => const Color(0xFF78787C);

  @override
  Color get whiteColor => Colors.white;

  @override
  Color get dividerColor => const Color(0xFFDADADA);

  @override
  Color get appRed => const Color(0xFFB70303);

  @override
  Color get appBottomBarBgColor => Colors.black;

  @override
  Color get appBackButtonColor => Colors.white;

  @override
  Color get secondBgColor => const Color(0xFF232527);

  @override
  Color get itemBgColor => const Color(0xFF1C1D1E);

  @override
  List<Color> get videoPermissionCoinBgColor => [
    const Color(0xFFFF5208),
    const Color(0xFFF2A21D),
  ];

  @override
  Color get videoPermissionCoinTextColor => Colors.black;

  @override
  List<Color> get videoPermissionFreeBgColor => [
    const Color(0xFFE2BE66),
    const Color(0xFFF7EDA5),
    const Color(0xFFE2BE66),
  ];

  @override
  Color get videoPermissionFreeTextColor => Colors.black;

  @override
  List<Color> get videoPermissionVipBgColor => [
    const Color(0xFFFFE7C3),
    const Color(0xFFEFB96F),
  ];

  @override
  Color get videoPermissionVipTextColor => Colors.black;


  @override
  Color get dialogBgColor => secondBgColor;

  @override
  Color get dialogTextColor => Colors.white;

  @override
  Color get dialogSecondColor => const Color(0xFF1B1B1B);

}
