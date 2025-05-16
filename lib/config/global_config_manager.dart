import 'dart:convert';

import 'package:flutter_se/bean/global_config_bean.dart';
import 'package:flutter_se/utils/cache_utils.dart';
import 'package:get/get.dart';

import '../bean/ad_info_bean.dart';

///全局配置信息
class GlobalConfig {
  GlobalConfig._internal();

  factory GlobalConfig() => _instance;

  static final GlobalConfig _instance = GlobalConfig._internal();

  static const _cacheKey = "_GlobalConfigCacheKey";

  GlobalConfigBean? _configBean;

  void initConfig(GlobalConfigBean configBean) {
    _configBean = configBean;
    CacheUtils.putString(_cacheKey, jsonEncode(configBean.toJson()));
  }

  void _checkInit() {
    if (_configBean == null) {
      var string = CacheUtils.getString(_cacheKey);
      if (string == null || string.isEmpty) {
        Get.toNamed("/");
        return;
      }
      _configBean = GlobalConfigBean.fromJson(jsonDecode(string));
    }
  }

  ///启动广告
  List<AdInfoBean> getLaunchAd() {
    _checkInit();
    return _configBean!.launchAdv;
  }

  ///弹窗广告
  List<AdInfoBean> getPopAd() {
    _checkInit();
    return _configBean!.popAdv;
  }

  ///搜索页面广告
  List<AdInfoBean> getSearchAd() {
    _checkInit();
    return _configBean!.searchAdv;
  }

  ///系统公告
  List<SystemAnnouncement> getSystemAnnouncement() {
    _checkInit();
    return _configBean!.systemAnnouncement;
  }

  // 全局配置
  Config? getConfig(key) {
    _checkInit();
    var config = _configBean!.config;
    return config.firstWhereOrNull((item) => item.key == key);
  }
}
