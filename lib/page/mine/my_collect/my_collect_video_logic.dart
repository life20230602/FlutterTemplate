import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';
import 'package:flutter_se/bean/video_list_item_bean.dart';
import 'package:flutter_se/page/common/video/video_item_logic_mixin.dart';

/// 我的收藏-视频
class MyBuyVideoLogic extends AppGetXBaseRefreshLogic
    with AppRefreshHelper<VideoListElement>, VideoItemLogicMixin {
  @override
  void onLoadData(bool firstLoad, int page, bool isLoadMore) {
    itemList.add(
      VideoListElement.fromJson({
        "id": 1,
        "permission_type": 1,
        "adv": false,
        "title": "法啊发法啊发法啊发法啊发法啊发 VV 想",
      }),
    );
    showSuccess();
  }
}
