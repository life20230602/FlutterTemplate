import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/bean/ad_info_bean.dart';
import 'package:flutter_se/page/splash/domain_selection_mixin.dart';
import 'package:get/get.dart';

import '../../base/http/exception/app_server_exception.dart';
import '../../http/rest_api_manager.dart';
import '../common/mixin/main_tab_config_load_mixin.dart';

class SplashLogic extends AppGetXBaseLogic
    with DomainSelectionMixin, MainTabConfigLoadMixin {
  //ui更新文本，通过obs关联刷新
  var lineTextObs = "检测线路".obs;

  ///启动广告
  final launchAdList = <AdInfoBean>[];

  ///配置是否请求完成
  final configSuccessObs = false.obs;

  @override
  void onLoad() {
    requestHost();
  }

  @override
  void onSelectionError(bool apiHostSuccess) {
    if (apiHostSuccess) {
      lineTextObs.value = "线路获取失败,请检查网络或官网更新应用~";
    } else {
      lineTextObs.value = "该包出错，请前往官网重新下载或重新打开~";
    }
  }

  @override
  void onSelectionProgress(String progress) {
    lineTextObs.value = progress;
  }

  @override
  void onSelectionSuccess(String baseUrl) async {
    //初始化网络请求
    ApiManager().initClient(baseUrl);
    loadMainTabConfig();
  }

  @override
  bool onTabConfigLoadError(AppServerException e) {
    lineTextObs.value = "用户信息获取失败，请重试！(${e.message})";
    return false;
  }

  @override
  void onTabConfigLoadSuccess() {
    configSuccessObs.value = true;
  }
}
