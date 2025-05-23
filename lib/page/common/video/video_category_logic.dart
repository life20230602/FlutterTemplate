import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';
import 'package:flutter_se/bean/video_list_item_bean.dart';
import 'package:flutter_se/page/common/video/video_item_logic_mixin.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

/// 视频列表分类
class VideoCategoryLogic extends AppGetXBaseRefreshLogic
    with AppRefreshHelper<VideoListElement>, VideoItemLogicMixin {
  @override
  void onLoadData(bool firstLoad, int page, bool isLoadMore) {
    itemList.add(
      VideoListElement.fromJson({
        "id": 1,
        "permission_type": 1,
        "adv": false,
        "title": "但是烦得很",
      }),
    );
    itemList.add(
      VideoListElement.fromJson({
        "id": 2,
        "permission_type": 2,
        "adv": false,
        "title": "但是烦得很",
      }),
    );
    itemList.add(
      VideoListElement.fromJson({
        "id": 3,
        "permission_type": 3,
        "adv": false,
        "title": "但是烦得很",
      }),
    );
    itemList.add(
      VideoListElement.fromJson({
        "id": 4,
        "permission_type": 1,
        "adv": false,
        "title": "但是烦得很",
      }),
    );
    itemList.add(
      VideoListElement.fromJson({
        "id": 5,
        "permission_type": 1,
        "adv": false,
        "title": "但是烦得很",
      }),
    );
    showSuccess();
  }

  @override
  RxList<VideoListElement> getVideoList() => itemList;
}
