import 'package:flutter/cupertino.dart';

import '../../../utils/app_dialog_utils.dart';

/// 导航数据
class NavigationItem {
  NavigationItem(
    this.text, {
    this.defaultImage,
    this.activeImage,
    this.activeColor,
    this.body,
  });

  final String text;

  //菜单图片
  final String? defaultImage;
  final String? activeImage;

  //图片一样直接着色就行
  final Color? activeColor;

  //菜单对应的内容
  final Widget? body;
}
