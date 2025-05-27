import 'package:get/get.dart';

import '../../../../bean/ad_info_bean.dart';
import '../../../../bean/video_list_item_bean.dart';

///视频item扩展
class ShortVideoListElementExt extends VideoListElement {
  //收藏状态
  late final RxBool isCollectObs;

  //点赞状态
  late final RxBool isUpvoteObs;

  //关注状态
  late final RxBool isFocusObs;

  AdInfoBean? adInfoBean;

  ShortVideoListElementExt({required super.id,
    required super.salePrice,
    required super.permissionType,
    required super.desc,
    required super.title,
    required super.horizontalCover,
    required super.videoLength,
    required super.favoriteCount,
    required super.commentCount,
    required super.upvoteCount,
    required super.clickCount,
    required super.uploader,
    required super.createdAt,
    required super.uploaderName,
    required super.uploaderAvatar,
    required super.adv,
    required super.jumpUri,
    required super.jumpType,
    required super.permissions,
    required super.tags,
    required super.isCollect,
    required super.isUpvote,
    required super.isFocus}) {
    isCollectObs = RxBool(isCollect);
    isUpvoteObs = RxBool(isUpvote);
    isFocusObs = RxBool(isFocus);
  }

  static ShortVideoListElementExt copyWith(VideoListElement element) {
    return ShortVideoListElementExt(id: element.id,
        salePrice: element.salePrice,
        permissionType: element.permissionType,
        desc: element.desc,
        title: element.title,
        horizontalCover: element.horizontalCover,
        videoLength: element.videoLength,
        favoriteCount: element.favoriteCount,
        commentCount: element.commentCount,
        upvoteCount: element.upvoteCount,
        clickCount: element.clickCount,
        uploader: element.uploader,
        createdAt: element.createdAt,
        uploaderName: element.uploaderName,
        uploaderAvatar: element.uploaderAvatar,
        adv: element.adv,
        jumpUri: element.jumpUri,
        jumpType: element.jumpType,
        permissions: element.permissions,
        tags: element.tags,
        isCollect: element.isCollect,
        isUpvote: element.isUpvote,
        isFocus: element.isFocus);
  }
}
