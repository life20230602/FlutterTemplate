import 'package:flutter/material.dart';
import 'package:flutter_se/res/style.dart';
import 'package:flutter_se/widget/no_balance_dialog.dart';
import 'package:flutter_se/widget/vip_video_line_dialog.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

///弹窗扩展实现
class AppDialogUtils {
  ///显示加载框
  static void showLoadingDialog() {
    SmartDialog.showLoading(msg: "正在加载...");
  }

  ///关闭加载框
  static void dismissLoadingDialog() {
    SmartDialog.dismiss();
  }

  ///显示提示文本
  static void showToast(String msg) {
    SmartDialog.showToast("", alignment: Alignment.center,
        builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.only(
            left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
            color: context.appTheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(25.0))),
        child: Text(
          textAlign: TextAlign.center,
          msg,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      );
    });
  }

  static void showDialog(Widget widget){
    Get.dialog(widget,barrierColor: Colors.transparent,useSafeArea: false);
  }

  static void showBottomSheet(Widget widget){
    Get.bottomSheet(widget);
  }

  ///余额不足弹窗
  static void showNoBalanceDialog(){
    showDialog(NoBalanceDialog());
  }

  ///vip 线路弹窗
  static void showVipVideoLineDialog(){
    showDialog(VipVideoLineDialog());
  }
}
