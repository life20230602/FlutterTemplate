import 'package:flutter/cupertino.dart';

extension BuildContextMediaQuery on BuildContext {
  MediaQueryData get queryDataFix =>
      MediaQueryData.fromView(WidgetsBinding.instance.window);

  double get heightFix => queryDataFix.size.height;

  double get widthFix => queryDataFix.size.width;

  double get paddingTopFix => queryDataFix.padding.top;

  double get keyboardHeight => queryDataFix.viewInsets.bottom;

  double get defaultDialogWidth => queryDataFix.size.width * 0.76;
}
