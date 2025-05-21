
import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';

/// 视频列表分类
class VideoCategoryLogic extends AppGetXBaseRefreshLogic{

  @override
  void onLoadData(bool firstLoad, int page, bool isLoadMore) {
    showSuccess();
  }

}