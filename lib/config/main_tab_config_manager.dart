import 'package:flutter_se/bean/main_tab_config_bean.dart';

///首页配置信息
class MainTabConfigManager {
  MainTabConfigManager._internal();

  factory MainTabConfigManager() => _instance;

  static final MainTabConfigManager _instance =
  MainTabConfigManager._internal();

  MainTabConfigBean? data;

  void init(MainTabConfigBean data) {
    this.data = data;
  }

  List<MainTabItemBean> getMuYinTabConfig() {
    return data?.winnow ?? [];
  }
}
