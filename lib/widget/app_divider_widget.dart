import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/res/style.dart';

/// app 分割线
class AppDividerWidget extends StatelessWidget {
  final double height;

  const AppDividerWidget({super.key, this.height = 0.5});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.appTheme.dividerColor,
      height: height,
      thickness: 0.5,
    );
  }
}
