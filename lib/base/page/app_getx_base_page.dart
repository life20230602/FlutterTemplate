import 'package:flutter/material.dart';
import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/base/page/base_page.dart';
import 'package:get/get.dart';

/// 页面基类,需要关联 controller
abstract class AppGetXBasePage<T extends AppGetXBaseLogic>
    extends StatelessWidget with BasePage {
  AppGetXBasePage({super.key});

  /// 注入控制器
  late final T _controller = Get.put(createController(), tag: logicTag());

  /// 状态控制器
  T get logic => _controller;

  /// 页面的TAG 如果有需要 复写
  String? logicTag() {
    return hashCode.toString();
  }

  @override
  void beforeBuild(BuildContext context) {}

  ///界面可见回调
  @override
  void onPageVisibilityChanged(bool visible) {
    logic.onPageVisibilityChanged(visible);
  }

  @override
  void retry() {
    logic.retry();
  }

  /// 是否显示加载页面
  @override
  bool showLoadingPage() {
    return true;
  }

  @override
  Rx? getLoadingState() {
    return logic.loadingState;
  }

  ///创建控制器
  T createController();

  /// 构建子View
  @override
  Widget buildChild(BuildContext context);
}
