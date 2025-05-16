import 'dart:async';

import 'package:flutter/material.dart';

///防止重复点击
class DebounceGestureTabWidget extends StatelessWidget {
  const DebounceGestureTabWidget(
      {super.key,
      required this.child,
      this.milliseconds = 800,
      required this.onTap});

  final Widget child;

  final int milliseconds;

  static Timer? _timer;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: child,
    );
  }

  void _onTap() {
    if (_timer != null && _timer!.isActive) {
      return;
    }
    onTap();
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      _timer = null;
    });
  }
}
