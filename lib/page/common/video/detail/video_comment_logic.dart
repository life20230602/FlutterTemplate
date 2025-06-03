import 'package:flutter/cupertino.dart';
import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../bean/video_comment_bean_ext.dart';
import 'video_comment_page.dart';


///视频评论
class VideoCommentLogic extends AppGetXBaseRefreshLogic {
  VideoCommentLogic({this.vid = 0,required this.onSendCommentListener});

  final OnSendCommentListener onSendCommentListener;
  final int vid;

  ///视频评论列表
  final commentListObs = <VideoCommentElementExt>[].obs;

  @override
  void onLoadData(bool firstLoad, int page, bool isLoadMore) {
    // client.getVideoComment({"page": page, "page_size": 20, "vid": vid}, cancelToken).then((value) {
    //   showSuccess();
    //   complete(value.list.isEmpty);
    //   if (isLoadMore) {
    //     commentListObs.addAll(value.list.map((e) => VideoCommentElementExt.copyWith(e)).toList());
    //   } else {
    //     commentListObs.value = value.list.map((e) => VideoCommentElementExt.copyWith(e)).toList();
    //   }
    // }).catchException(this, showErrorPage: firstLoad);
  }

  ///发送评论
  void sendComment(String text, TextEditingController controller) {
    // bindLoading(ApiManager.getDefaultClient().sendComment({"vid": vid, "content": text}, cancelToken)).then((value) {
    //   ///评论成功清空输入框
    //   controller.clear();
    //   if (value.status == 1 || value.status == 2) {
    //     AppDialogUtils.showToast("评论成功!");
    //     commentListObs.insert(0, VideoCommentElementExt.copyWith(value));
    //     onSendCommentListener();
    //   } else {
    //     AppDialogUtils.showToast("评论成功,审核中");
    //   }
    // }).catchException(this, showErrorPage: false);
  }

  ///点赞评论
  void likeComment(VideoCommentElementExt item) {
    // var isUpvote = !item.isUpvote;
    // ApiManager.getRetryClient().likeComment({"type": 2, "collect": isUpvote, "mid": item.id}, cancelToken).then((value) {
    //   if (isUpvote) {
    //     item.likeCount++;
    //   } else {
    //     item.likeCount--;
    //   }
    //   item.isUpvote = isUpvote;
    //   item.upvoteStateObs.value = isUpvote;
    // }).catchException(this, showErrorPage: false);
  }
}
