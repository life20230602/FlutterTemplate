import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../route/route_utils.dart';


///短视频vip覆盖层
class ShortVideoVipCoverDialogWidget extends StatelessWidget {
  const ShortVideoVipCoverDialogWidget({super.key});

  static void show() {
    SmartDialog.show(builder: (context) => const ShortVideoVipCoverDialogWidget(), tag: "ShortVideoVipCoverDialogWidget");
  }

  static void dismiss() {
    SmartDialog.dismiss(tag: "ShortVideoVipCoverDialogWidget");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(color: context.appTheme.dialogBgColor, borderRadius: BorderRadius.circular(12.8)),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              child: Icon(
                Icons.close,
                color: context.appTheme.dialogTextColor,
                size: 22,
              ),
              onTap: () {
                dismiss();
              },
            ),
          ),
          _buildTitle(context),
          _buildBody(context),
          _buildButton(context),
        ],
      ),
    );
  }

  ///提示文字
  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 15, 12, 28),
      child: Text(
        "成为会员后可观看完整视频内容及享受其它会员福利。",
        style: TextStyle(fontSize: 14, color: context.appTheme.dialogTextColor),
      ),
    );
  }

  ///开通会员
  Widget _buildButton(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        child: Container(
          height: 44,
          width: constraints.maxWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: context.theme.primaryColor, borderRadius: BorderRadius.circular(22)),
          child: Text(
            "开通会员",
            style: TextStyle(color: context.appTheme.primary, fontSize: 18),
          ),
        ),
        onTap: () {
          dismiss();
          // RouteUtils.toVip();
        },
      );
    });
  }

  ///标题
  Widget _buildTitle(BuildContext context) {
    return Column(
      children: [
        Text(
          "开通会员无限制观看",
          style: TextStyle(fontSize: 16, color: context.appTheme.dialogTextColor,fontWeight: FontWeight.bold),
        ),
        Container(
          height: 3.2,
          width: 15,
          margin: const EdgeInsets.only(bottom: 5),
          color: context.theme.primaryColor,
        ),
        Text(
          "非会员只能观看10秒",
          style: TextStyle(fontSize: 14, color: context.theme.primaryColor),
        )
      ],
    );
  }
}
