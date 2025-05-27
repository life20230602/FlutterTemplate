import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';
import 'package:get/get.dart';

import '../../../base/logic/app_refresh_helper_mixin.dart';
import '../../../bean/video_list_item_bean.dart';
import '../../../config/user_manager_utils.dart';
import '../../../widget/player/app_player.dart';
import '../../common/mixin/player_record_mixin_controller.dart';
import 'bean/short_video_list_element_ext.dart';

///短视频
class ShortVideoPlayerLogic extends AppGetXBaseRefreshLogic
    with AppRefreshHelper<ShortVideoListElementExt>, PlayerRecordMixinController {
  ///vip 状态是否变更为VIP
  final vipStatusObs = false.obs;

  ///静音状态
  final muteStatusObs = false.obs;

  late final PageController pageController;

  final AppPlayerController playerController = AppPlayerController();

  ShortVideoPlayerLogic({this.tempList, int index = 0}){
    pageController = PageController(initialPage: index);
  }

  final List<VideoListElement>? tempList;

  @override
  void onResume() {
    super.onResume();
    if (!UserManager.get().isVip()) {
      //刷新用户信息
    }
  }

  @override
  void onLoadData(bool firstLoad, int page, bool isLoadMore) {
    ///处理外部传递过来的数据
    if (tempList != null && firstLoad) {
      final list = <ShortVideoListElementExt>[];
      for (var element in tempList!) {
        list.add(ShortVideoListElementExt.copyWith(element));
      }
      notify(firstLoad, isLoadMore, list);
      return;
    }
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  ///作者关注
  void clickFocus(ShortVideoListElementExt item) {
    // if (item.isFocus) {
    //   return;
    // }
    // final isFocus = !item.isFocus;
    //先刷新页面，立即显示效果
    // item.isFocusObs.value = isFocus;
    // ApiManager.getRetryClient().likeComment({"type": 8, "collect": isFocus, "mid": item.id}, cancelToken).then((value) {
    //   item.isFocusObs.value = isFocus;
    //   item.isFocus = isFocus;
    // }).catchException(this, showErrorPage: false, onAppException: (exception) {
    //   //异常还原
    //   item.isFocusObs.value = item.isFocus;
    //   return false;
    // });
  }

  ///视频点赞
  void clickLike(ShortVideoListElementExt item) {
    //原来的数量
    // final sourceCount = item.upvoteCount;
    // final isUpvote = !item.isUpvote;
    // if (isUpvote) {
    //   item.upvoteCount++;
    // } else {
    //   item.upvoteCount--;
    // }
    // //先刷新页面，立即显示效果
    // item.isUpvoteObs.value = isUpvote;
    //
    // ApiManager.getRetryClient().likeComment({"type": 3, "collect": isUpvote, "mid": item.id}, cancelToken).then((value) {
    //   item.isUpvoteObs.value = isUpvote;
    //   item.isUpvote = isUpvote;
    // }).catchException(this, showErrorPage: false, onAppException: (exception) {
    //   //异常还原数量
    //   item.upvoteCount = sourceCount;
    //   item.isUpvoteObs.value = item.isUpvote;
    //   return false;
    // });
  }

  ///视频收藏
  void clickCollect(ShortVideoListElementExt item) {
    //原来的数量
    // final sourceCount = item.favoriteCount;
    // final isCollect = !item.isCollect;
    // if (isCollect) {
    //   item.favoriteCount++;
    // } else {
    //   item.favoriteCount--;
    // }
    // //先刷新页面，立即显示效果
    // item.isCollectObs.value = isCollect;
    //
    // ApiManager.getRetryClient().likeComment({"type": 4, "collect": isCollect, "mid": item.id}, cancelToken).then((value) {
    //   item.isCollectObs.value = isCollect;
    //   item.isCollect = isCollect;
    // }).catchException(this, showErrorPage: false, onAppException: (exception) {
    //   //异常还原数量
    //   item.favoriteCount = sourceCount;
    //   item.isCollectObs.value = item.isCollect;
    //   return false;
    // });
  }

  ///静音状态切换
  void toggleMute() {
    playerController.toggleMute().then((value) {
      muteStatusObs.value = playerController.isMute();
    });
  }
}
