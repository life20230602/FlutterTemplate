import 'package:flutter/cupertino.dart';
import 'package:flutter_se/res/flavor.dart';
import 'package:flutter_se/res/themes.dart';

extension BuildContextExt on BuildContext {
  ///app 主题颜色
  AppTheme get appTheme => Flavors().getAppTheme(this);
}
