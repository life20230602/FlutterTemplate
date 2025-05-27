import 'package:flutter/cupertino.dart';

/// 图文结合
class MixIconText extends StatelessWidget {
  ///文字
  final Widget? text;

  //icon
  final Widget? icon;

  //间隔
  final double spacing;

  //排列
  final Axis direction;

  //是否翻转,文字和图标换位置，默认左图右文
  final bool reverse;

  //主轴对齐方式
  final MainAxisAlignment mainAxisAlignment;

  //次轴对齐方式
  final CrossAxisAlignment crossAxisAlignment;

  //主轴大小
  final MainAxisSize mainAxisSize;

  const MixIconText({
    super.key,
    this.text,
    this.icon,
    this.spacing = 8.0,
    this.direction = Axis.horizontal,
    this.reverse = false,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.min,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> list = List.empty(growable: true);
    if (icon != null) {
      list.add(icon!);
    }
    if (icon != null && text != null && (spacing != 0)) {
      list.add(SizedBox(
        width: spacing,
        height: spacing,
      ));
    }
    if (text != null) {
      list.add(text!);
    }
    if (list.isEmpty) {
      list.add(const SizedBox());
    }

    return list.length == 1
        ? list.first
        : direction == Axis.horizontal
            ? Row(
                mainAxisSize: mainAxisSize,
                crossAxisAlignment: crossAxisAlignment,
                mainAxisAlignment: mainAxisAlignment,
                textDirection: reverse ? TextDirection.rtl : TextDirection.ltr,
                children: list,
              )
            : Column(
                mainAxisSize: mainAxisSize,
                mainAxisAlignment: mainAxisAlignment,
                verticalDirection:
                    reverse ? VerticalDirection.up : VerticalDirection.down,
                crossAxisAlignment: crossAxisAlignment,
                children: list,
              );
  }
}
