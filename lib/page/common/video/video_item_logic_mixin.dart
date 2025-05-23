import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';
import 'package:flutter_se/bean/video_list_item_bean.dart';
import 'package:get/get.dart';

mixin VideoItemLogicMixin on AppGetXBaseRefreshLogic {
  ///视频数据，子类去实现,类型必须是 VideoListElement
  RxList<VideoListElement> getVideoList();
}
