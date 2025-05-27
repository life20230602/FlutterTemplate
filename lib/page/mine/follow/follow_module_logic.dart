import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';

/// 我的关注-模块
class FollowModuleLogic extends AppGetXBaseRefreshLogic with AppRefreshHelper<String>{

  @override
  void onLoadData(bool firstLoad, int page, bool isLoadMore) {
    itemList.add("element");
    itemList.add("element1");
    itemList.add("element2");
    itemList.add("element3");
    showSuccess();
  }

}