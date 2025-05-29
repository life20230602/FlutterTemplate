import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';

/// app 分割线
class AppDividerWidget extends StatelessWidget {
  final double size;
  final double thickness;
  final bool verticalDivider;
  final Color? color;

  const AppDividerWidget({
    super.key,
    this.size = 0.5,
    this.thickness = 0.5,
    this.verticalDivider = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (verticalDivider) {
      return VerticalDivider(
        color: color ?? context.appTheme.dividerColor,
        thickness: thickness,
        width: size,
      );
    }
    return Divider(
      color: color ?? context.appTheme.dividerColor,
      height: size,
      thickness: thickness,
    );
  }
}
