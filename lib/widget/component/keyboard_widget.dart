import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:keyboard_detection/keyboard_detection.dart';

typedef OnKeyBoardVisibleListener = Function(bool visible);

///键盘监控
class KeyboardWidget extends StatefulWidget {
  const KeyboardWidget(
      {super.key,
      required this.child,
      required this.onKeyBoardVisibleListener});

  static KeyboardDetectionController keyboardDetectionController =
      KeyboardDetectionController();

  final Widget child;
  final OnKeyBoardVisibleListener onKeyBoardVisibleListener;

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<KeyboardWidget> {
  late StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    _streamSubscription =
        KeyboardWidget.keyboardDetectionController.stream.listen((event) {
      widget.onKeyBoardVisibleListener(
          event == KeyboardState.visible || event == KeyboardState.visibling);
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }
}
