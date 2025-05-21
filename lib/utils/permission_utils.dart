import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

/// 权限申请dialog工具类
class PermissionUtils {
  /// androidStatus 安卓权限
  /// iosStatus  ios权限
  /// title  弹窗标题
  /// content 弹窗内容
  static Future<bool> requestPermission(
      {required Future androidStatus,
      required Future iosStatus,
      title,
      content}) async {
    late PermissionStatus status;

    if (Platform.isIOS) {
      status = await iosStatus;
    } else {
      status = await androidStatus;
    }
    // 异步中使用context时使用mounted检查
    if (status != PermissionStatus.granted) {
      showCupertinoDialog(
          context: Get.context!,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text(title,style: TextStyle(
                fontSize: 16
              ),),
              content: Text(content),
              actions: <Widget>[
                CupertinoDialogAction(
                  child:  Text("取消",style: TextStyle(
                      fontSize: 15,color: Color(0xffA09F9F)
                  )),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoDialogAction(
                  child: Text("确定",style: TextStyle(
                    fontSize: 15,color: context.appTheme.primary
                  ),),
                  onPressed: () {
                    Navigator.pop(context);
                    // 打开手机上该app权限的页面
                    openAppSettings();
                  },
                ),
              ],
            );
          });
    } else {
      return true;
    }
    return false;
  }
}
