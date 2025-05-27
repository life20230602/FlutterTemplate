import 'package:flutter/material.dart';
import 'package:flutter_se/res/style.dart';
import 'package:flutter_se/utils/build_context_extension.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/// 统一弹窗容器=> 底部弹出选择菜单
class AppBottomSheetContainerWidget extends StatelessWidget {
  const AppBottomSheetContainerWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: child,
      ),
    );
  }
}

/// 统一弹窗容器=> 中间弹出dialog
class AppDialogContainerWidget extends StatelessWidget {
  const AppDialogContainerWidget({
    super.key,
    required this.child,
    this.bottomChild,
    this.backgroundColor = Colors.black,
    this.backgroundRadius = 10,
  });

  final Widget child;
  final Widget? bottomChild;
  final Color backgroundColor;
  final double backgroundRadius;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).maybePop();
            },
            child: ColoredBox(color: Colors.black54),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: context.defaultDialogWidth,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(backgroundRadius),
                ),
                child: child,
              ),
              if (bottomChild != null) bottomChild!,
            ],
          ),
        ],
      ),
    );
  }
}

///app 统一确认弹窗提示框
class AppDialogWidget extends StatefulWidget {
  const AppDialogWidget(
    this.title,
    this.body, {
    super.key,
    this.onConfirm,
    this.onCancel,
    this.cancelText,
    this.confirmText,
  });

  final Function? onConfirm;

  final Function? onCancel;

  final Widget? title;
  final Widget body;

  final String? confirmText;
  final String? cancelText;

  @override
  State<StatefulWidget> createState() {
    return _State();
  }

  static Function? _defaultCancel() {
    return null;
  }

  static Widget buildDefault(
    String title,
    String message, {
    Function? onConfirm,
    Function? onCancel,
    String? cancelText,
    String? confirmText,
  }) {
    return AppDialogWidget(
      Text(title, style: const TextStyle(fontSize: 18)),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Text(message, style: const TextStyle(fontSize: 15)),
      ),
      onConfirm: onConfirm,
      onCancel: onCancel ?? _defaultCancel,
      cancelText: cancelText,
      confirmText: cancelText,
    );
  }
}

class _State extends State<AppDialogWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppDialogContainerWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center, //居中
        children: [
          _buildTitle(),
          _buildMessage(),
          const SizedBox(height: 20),
          _buildButtons(context),
        ],
      ),
    );
  }

  ///标题
  Widget _buildTitle() {
    if (widget.title == null) {
      return const SizedBox.shrink();
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: widget.title,
    );
  }

  ///消息
  Widget _buildMessage() {
    return Container(child: widget.body);
  }

  ///按钮
  Widget _buildButtons(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (widget.onCancel != null)
          TextButton(
            onPressed: () {
              SmartDialog.dismiss();
              widget.onCancel!();
            },
            child: Text(
              widget.cancelText ?? "取消",
              style: TextStyle(color: context.appTheme.appGrey, fontSize: 16),
            ),
          ),
        if (widget.onConfirm != null)
          TextButton(
            onPressed: () {
              SmartDialog.dismiss();
              if (widget.onConfirm != null) {
                widget.onConfirm!();
              }
            },
            child: Text(
              widget.confirmText ?? "确认",
              style: TextStyle(color: context.appTheme.primary, fontSize: 16),
            ),
          ),
      ],
    );
  }
}
