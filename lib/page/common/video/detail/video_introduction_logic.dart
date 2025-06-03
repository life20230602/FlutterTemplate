import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../../bean/video_list_item_bean.dart';


///视频简介
class VideoIntroductionLogic extends AppGetXBaseLogic {
  VideoIntroductionLogic({required bool collect}){
    collectStatusObs = collect.obs;
  }

  ///视频点赞状态
  late RxBool collectStatusObs;

  ///点赞视频
  void likeVideo(VideoListElement item,bool collect) {
    //原来的数量
    final sourceFavoriteCount = item.favoriteCount;
    if (collect) {
      item.favoriteCount++;
    } else {
      item.favoriteCount--;
    }
    //先刷新页面，立即显示效果
    collectStatusObs.value = collect;
    // ApiManager.getRetryClient().likeComment({"type": 1, "collect": collect, "mid": item.id}, cancelToken).then((value) {
    // }).catchException(this, showErrorPage: false,onAppException: (exception){
    //   //异常还原数量
    //   item.favoriteCount = sourceFavoriteCount;
    //   collectStatusObs.value = !collect;
    //   return false;
    // });
  }

  @override
  void onLoad() {
  }
}
