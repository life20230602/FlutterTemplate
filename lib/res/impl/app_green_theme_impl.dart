import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_se/res/themes.dart';

///黑绿色主题实现
class AppGreenThemeImpl extends AppTheme {
  BuildContext context;

  AppGreenThemeImpl({required this.context});

  @override
  Color get primary => const Color(0xFF00D542);

  @override
  Color get titleTextColor => Colors.white;

  @override
  Color get appGrey => const Color(0xFFBEBBBA);

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
  Color get appRed => const Color(0xFFFF3A30);

  @override
  Color get appBottomBarBgColor => Colors.black;

  @override
  Color get appBackButtonColor => Colors.white;

  @override
  Color get secondBgColor => Color(0xFF232527);

  @override
  List<Color> get videoPermissionCoinBgColor => [
    const Color(0xFFFFC85C),
    const Color(0xFFFF4452),
  ];

  @override
  Color get videoPermissionCoinTextColor => Colors.white;

  @override
  List<Color> get videoPermissionFreeBgColor => [
    const Color(0xFFE2BE66),
    const Color(0xFFF7EDA5),
    const Color(0xFFE2BE66),
  ];

  @override
  Color get videoPermissionFreeTextColor => primary;

  @override
  List<Color> get videoPermissionVipBgColor => [
    const Color(0xFFFF68F9),
    const Color(0xFF5D3CDD),
  ];

  @override
  Color get videoPermissionVipTextColor => Colors.white;
}
