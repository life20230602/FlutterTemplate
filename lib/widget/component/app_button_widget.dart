import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/res/style.dart';

///app button 按钮
class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    this.onTap,
    this.radius = 50,
    this.width,
    required this.text,
    this.textSize = 14,
    required this.height,
    this.textColor,
    this.padding,
    this.gradient,
  });

  final VoidCallback? onTap;
  final double? radius;
  final String text;
  final double? textSize;
  final double height;
  final double? width;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final List<Color>? gradient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Container(
          padding: padding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 50),
            gradient: LinearGradient(
              colors: gradient ?? [Color(0xFF2FCCF7), Color(0xFF00DF39)],
            ),
          ),
          child: Text(
            text,
            strutStyle: StrutStyle(forceStrutHeight: true),
            style: TextStyle(
              color: textColor ?? context.appTheme.appButtonTextColor,
              fontSize: textSize,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
