import 'package:flutter/cupertino.dart';

///禁止child 刷新
class ShouldRebuildWidget extends StatefulWidget {
  const ShouldRebuildWidget(
      {super.key, required this.child, this.rebuild = false});
  final Widget child;
  final bool rebuild;

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ShouldRebuildWidget> {
  Widget? oldWidget;

  @override
  Widget build(BuildContext context) {
    if (widget.rebuild) {
      return widget.child;
    }
    if (oldWidget != null) {
      return oldWidget!;
    }
    oldWidget = widget.child;
    return widget.child;
  }
}
