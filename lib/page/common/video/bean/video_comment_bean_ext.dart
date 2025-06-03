import 'package:get/get.dart';

import '../../../../bean/video_comment_bean.dart';

class VideoCommentElementExt extends VideoCommentListElement{

  late RxBool upvoteStateObs;

  VideoCommentElementExt({required super.id, required super.uid, required super.nickname, required super.content,
    required super.replyCount, required super.likeCount, required super.createdAt, required super.commentType,
    required super.status, required super.avatar, required super.grade, required super.isUpvote}){
    upvoteStateObs = RxBool(isUpvote);
  }

  static VideoCommentElementExt copyWith(VideoCommentListElement element) =>
      VideoCommentElementExt(
        id: element.id,
        uid: element.uid,
        nickname: element.nickname,
        content: element.content,
        replyCount: element.replyCount,
        likeCount: element.likeCount,
        createdAt: element.createdAt,
        commentType: element.commentType,
        status: element.status,
        avatar: element.avatar,
        grade: element.grade,
        isUpvote: element.isUpvote,
      );
}