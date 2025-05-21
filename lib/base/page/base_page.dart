import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_se/base/widget/loading_layout.dart';
import 'package:flutter_se/res/style.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../widget/component/app_back_button_widget.dart';

/// 页面基类
mixin BasePage on StatelessWidget {
  BuildContext get context => Get.context!;

  /// 注入控制器
  void beforeBuild(BuildContext context) {}

  /// 是否显示加载页面
  bool showLoadingPage() {
    return true;
  }

  /// 是否需要启用顶部安全区域也就是 状态栏
  bool enableTopSafeArea() {
    return true;
  }

  /// 是否需要启用底部安全区域也就是 导航栏
  bool enableBottomSafeArea() {
    return !kIsWeb && Platform.isAndroid;
  }

  ///是否是用作独立的widget模式，如果是，不再使用Scaffold包裹
  bool isWidgetMode() => false;

  ///输入法兼容
  bool resizeToAvoidBottomInset() => true;

  @override
  Widget build(BuildContext context) {
    beforeBuild(context);
    return VisibilityDetector(
      key: Key(hashCode.toString()),
      child:
          isWidgetMode()
              ? SafeArea(
                top: enableTopSafeArea(),
                bottom: enableBottomSafeArea(),
                child: Container(
                  color: backgroundColor(),
                  child: _buildChild(context),
                ),
              )
              : _bodyScaffold(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 1.0) {
          onPageVisibilityChanged(true);
        } else if (info.visibleFraction == 0) {
          onPageVisibilityChanged(false);
        }
      },
    );
  }

  ///页面框架
  Widget _bodyScaffold() {
    final backListener = onBackListener();
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        backListener!();
      },
      //是否拦截返回键
      canPop: backListener == null,
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
        backgroundColor: backgroundColor(),
        appBar: showTitle() ? buildAppBar(context) : null,
        bottomNavigationBar: buildBottomNavigationBar(),
        body: SafeArea(
          top: enableTopSafeArea(),
          bottom: enableBottomSafeArea(),
          child: _buildChild(context),
        ),
      ),
    );
  }

  ///界面可见回调
  void onPageVisibilityChanged(bool visible) {}

  ///构建底部导航
  Widget? buildBottomNavigationBar() {
    return null;
  }

  ///加载状态变量
  Rx? getLoadingState();

  ///加载失败，重试
  void retry();

  /// 加载子类的页面
  Widget _buildChild(BuildContext context) {
    // 显示加载页面
    if (showLoadingPage() && getLoadingState() != null) {
      return Obx(
        () => LoadingLayout(
          state: getLoadingState()!.value,
          retry: retry,
          contentBuilder: (context) {
            return buildChild(context);
          },
        ),
      );
    }
    return buildChild(context);
  }

  /// 标题相关 ========================================================
  /// 是否显示AppBar 默认显示
  bool showTitle() {
    return true;
  }

  /// 标题高度
  double? titleHeight() {
    return null;
  }

  /// 标题剧中
  bool titleCenter() {
    return true;
  }

  /// 标题背景色
  Color? titleBackgroundColor() {
    return context.appTheme.titleBackground;
  }

  /// 是否显示返回按钮
  bool showBack() {
    return true;
  }

  ///返回键
  Widget buildBack() {
    return AppBackButton(color: backColor());
  }

  ///返回按键宽度
  double? backWidth() {
    return 60;
  }

  /// 返回按钮的颜色
  Color? backColor() {
    return context.appTheme.appBackButtonColor;
  }

  /// 右边按钮或控件
  List<Widget>? titleActions() {
    return null;
  }

  /// 标题
  String title() {
    return "";
  }

  ///标题字体样式
  TextStyle? titleTextStyle() {
    return null;
  }

  /// 构建标题文本
  Widget buildTitle() {
    return Text(
      title(),
      style: titleTextStyle(),
      strutStyle: StrutStyle(forceStrutHeight: true),
    );
  }

  /// 构建标题
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: titleHeight(),
      centerTitle: titleCenter(),
      elevation: 0,
      // 阴影高度：0
      backgroundColor: titleBackgroundColor(),
      titleSpacing: showBack() ? 0 : null,
      leadingWidth: backWidth(),
      leading: showBack() ? buildBack() : null,
      actionsPadding: EdgeInsets.only(right: 18),
      actions: titleActions(),
      title: buildTitle(),
    );
  }

  ///返回键监听
  Function()? onBackListener() {
    return null;
  }

  /// 标题相关 ========================================================

  /// 页面背景
  Color? backgroundColor() {
    return context.appTheme.appBackground;
  }

  /// 构建子View
  Widget buildChild(BuildContext context);

  ///返回上一级
  void back({dynamic result}) {
    Get.back(result: result);
  }
}
