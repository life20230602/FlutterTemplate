import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_se/res/style.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    super.key,
    this.focusNode,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength = 16,
    this.textSize = 16,
    this.label,
    this.style,
    this.controller,
    this.labelStyle,
    this.hint,
    this.hintStyle,
    this.obscureText = false,
    this.inputFormatters,
    this.inputType = TextInputType.text,
  });

  final FocusNode? focusNode;
  final int minLines;
  final int maxLines;
  final int maxLength;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final String? label;
  final String? hint;
  final double textSize;
  //是否隐藏内容，密码框
  final bool obscureText;
  final TextInputType inputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      minLines: minLines,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: inputType,
      cursorColor: context.appTheme.primary,
      controller: controller,
      style:
          style ??
          TextStyle(fontSize: textSize, color: context.appTheme.blackColor),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        counterText: "",
        hintStyle: hintStyle ?? TextStyle(fontSize: textSize,color: Color(0xCCB4B0AD)),
        labelStyle:
            labelStyle ??
            TextStyle(
              fontSize: textSize,
              color: context.appTheme.secondTextColor,
            ),
        isDense: true,
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        isCollapsed: true,
      ),
    );
  }
}
