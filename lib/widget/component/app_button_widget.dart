import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/res/style.dart';

///app button 按钮
class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    this.onTap,
    this.radius = 8,
    this.width = double.infinity,
    required this.text,
    this.textSize = 16,
    required this.height,
    this.textColor,
    this.backgroundPressedColor,
    this.backgroundColor,
  });

  final VoidCallback? onTap;
  final double? radius;
  final String text;
  final double? textSize;
  final double height;
  final double width;
  final Color? textColor;
  final Color? backgroundPressedColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          if (onTap != null) {
            onTap!();
          }
        },
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.zero),
          elevation: const WidgetStatePropertyAll(0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius!))),
          backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? context.appTheme.appButtonBackgroundColor),
          overlayColor: MaterialStateProperty.all(backgroundPressedColor ??
              context.appTheme.appButtonBackgroundPressedColor),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor ?? context.appTheme.appButtonTextColor,
              fontSize: textSize),
        ),
      ),
    );
  }
}
