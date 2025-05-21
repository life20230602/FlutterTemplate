import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';

///短视频
class ShortVideoLogic extends AppGetXBaseRefreshLogic with AppRefreshHelper<String>{

  @override
  void onLoadData(bool firstLoad, int page, bool isLoadMore) {

    itemList.add("element");
    itemList.add("element");
    itemList.add("element");
    itemList.add("element");
    itemList.add("element");
    itemList.add("element");
    itemList.add("element");
    itemList.add("element");
    itemList.add("element");
    itemList.add("element");
    itemList.add("element");
    itemList.add("element");
  }
}
