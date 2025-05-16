import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';
import 'package:get/get.dart';

///统一的列表刷新数据处理
mixin AppRefreshHelper<T> on AppGetXBaseRefreshLogic {
  final itemList = <T>[].obs;

  ///通知数据刷新
  void notify(bool firstLoad, bool isLoadMore, List<T> list) {
    if (firstLoad && list.isEmpty) {
      showEmpty();
    } else {
      showSuccess();
      if (isLoadMore) {
        itemList.addAll(list);
      } else {
        itemList.value = list;
      }
    }
    complete(list.isEmpty);
  }
}
