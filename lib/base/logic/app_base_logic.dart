import 'package:flutter_se/http/rest_api.dart';
import 'package:flutter_se/http/rest_api_manager.dart';
import 'package:get/get.dart';

import '../widget/loading_layout.dart';
import 'app_base_network_logic.dart';

/// 1. 页面的状态管理
abstract class AppGetXBaseLogic extends GetxController
    with AppBaseNetworkLogic {
  /// 页面加载状态 在自定义加载类中
  var loadingState = LoadingState.loading.obs;

  ///是否已经被关闭了
  bool _close = false;

  RestClient? _client;

  RestClient get client => _client!;

  /// 初始化
  @override
  void onInit() {
    super.onInit();
    if (ApiManager().isInit()) {
      _client = ApiManager().getRetryClient();
    }
  }

  @override
  void onReady() {
    super.onReady();
    onLoad();
  }

  /// 销毁
  @override
  void onClose() {
    onNetworkClose();
    _close = true;
    super.onClose();
  }

  /// 重试
  void retry() {
    showLoading();
    // 准备好
    onLoad();
  }

  ///页面可见状态回调
  void onPageVisibilityChanged(bool visible) {
    if (_close) {
      return;
    }
    if (visible) {
      onResume();
    } else {
      onPause();
    }
  }

  ///页面获得焦点,也就代表页面可见
  void onResume() {}

  ///页面失去焦点，也就代表页面不可见
  void onPause() {}

  /// 显示成功页面
  void showSuccess() {
    if (loadingState.value == LoadingState.success) {
      return;
    }
    loadingState.value = LoadingState.success;
  }

  /// 显示空页面
  void showEmpty() {
    if (loadingState.value == LoadingState.empty) {
      return;
    }
    loadingState.value = LoadingState.empty;
  }

  /// 显示错误页面
  void showError() {
    if (loadingState.value == LoadingState.error) {
      return;
    }
    loadingState.value = LoadingState.error;
  }

  /// 显示加载中页面
  void showLoading() {
    if (loadingState.value == LoadingState.loading) {
      return;
    }
    loadingState.value = LoadingState.loading;
  }

  ///加载数据
  void onLoad();
}
