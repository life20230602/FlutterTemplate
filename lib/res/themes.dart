import 'dart:ui';

///app 颜色管理
abstract class AppTheme {

  /// 主色调
  Color get primary;

  ///背景色
  Color get appBackground;

  ///app 标题颜色
  Color get titleTextColor;

  /// app 的灰色
  Color get appGrey;

  /// 标题区域背景色
  Color get titleBackground;

  ///按钮颜色
  Color get appButtonTextColor;

  ///按钮背景颜色
  Color get appButtonBackgroundColor;

  ///按钮按压背景颜色
  Color get appButtonBackgroundPressedColor;

  ///黑色
  Color get blackColor;

  ///二级文字颜色
  Color get secondTextColor;

  ///白色
  Color get whiteColor;

  ///分割线颜色
  Color get dividerColor;

  ///返回按钮颜色
  Color get backColor;

  ///红色
  Color get appRed;

  ///app 底部导航背景色
  Color get appBottomBarBgColor;

}
