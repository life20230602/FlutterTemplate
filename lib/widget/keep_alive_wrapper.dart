import 'package:flutter/material.dart';

/// 保持页面状态无刷新
/// 用法：KeepAliveWrapper(child: xxxPage()
class KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  /// 保持页面状态无刷新
  const KeepAliveWrapper({super.key, required this.child});

  @override
  KeepAliveWrapperState createState() => KeepAliveWrapperState();
}

class KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
