import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomUnderlineTabIndicator extends Decoration {
  const CustomUnderlineTabIndicator({
    this.borderSide = const BorderSide(width: 2.0, color: Colors.black),
    this.insets = EdgeInsets.zero,
    this.indicatorBottom = 0.0,
    this.indicatorWidth = 28,
    this.isRound = false,
  });

  final BorderSide borderSide;
  final EdgeInsetsGeometry insets;
  final double indicatorBottom; // 自定义指示条距离底部距离
  final double indicatorWidth; // 自定义指示条宽度
  final bool? isRound; // 自定义指示条是否是圆角

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is CustomUnderlineTabIndicator) {
      return CustomUnderlineTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is CustomUnderlineTabIndicator) {
      return CustomUnderlineTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this, onChanged, isRound ?? false);
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
//取中间坐标
    double cw = (indicator.left + indicator.right) / 2;
// ***************************这里可以自定义指示条的宽度和底部间距***************************
    Rect indictorRect = Rect.fromLTWH(
        cw - indicatorWidth / 2,
        indicator.bottom - borderSide.width - indicatorBottom,
        indicatorWidth,
        borderSide.width);
    return indictorRect;
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback? onChanged, this.isRound)
      : assert(decoration != null),
        super(onChanged);

  final CustomUnderlineTabIndicator decoration;
  bool isRound = false;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = decoration
        ._indicatorRectFor(rect, textDirection)
        .deflate(decoration.borderSide.width / 2.0);
//***************************这里可以自定义指示条是否是圆角***************************
    final Paint paint = decoration.borderSide.toPaint()
      ..strokeCap = isRound ? StrokeCap.round : StrokeCap.square;
    canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
  }
}

enum TabBarIndicatorSize {
  tab,
  label,
}
