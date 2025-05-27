import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';
import 'package:flutter_se/bean/video_list_item_bean.dart';
import 'package:get/get.dart';

mixin VideoItemLogicMixin on AppRefreshHelper<VideoListElement> {
  ///切换列表显示列数 0 两列 1 1列
  final showTypeObs = 0.obs;

  ///切换显示类型
  void toggleListOrGrid() {
    final type = showTypeObs.value;
    if (type == 0) {
      showTypeObs.value = 1;
    } else {
      showTypeObs.value = 0;
    }
  }
}
