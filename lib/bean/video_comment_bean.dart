
import 'package:flutter_se/bean/page_bean.dart';

///视频评论
class VideoCommentBean {
  List<VideoCommentListElement> list;
  Page page;

  VideoCommentBean({
    required this.list,
    required this.page,
  });

  factory VideoCommentBean.fromJson(Map<String, dynamic> json) => VideoCommentBean(
    list: List<VideoCommentListElement>.from(json["list"].map((x) => VideoCommentListElement.fromJson(x))),
    page: Page.fromJson(json["page"]),
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "page": page.toJson(),
  };
}

class VideoCommentListElement {
  int id;
  int uid;
  String nickname;
  String content;
  int replyCount;
  int likeCount;
  int createdAt;
  int commentType;
  int status;//0 未审核 1 已通过  2 免审通过  3 审核未通过
  String avatar;
  int grade;
  bool isUpvote;

  VideoCommentListElement({
    required this.id,
    required this.uid,
    required this.nickname,
    required this.content,
    required this.replyCount,
    required this.likeCount,
    required this.createdAt,
    required this.commentType,
    required this.status,
    required this.avatar,
    required this.grade,
    required this.isUpvote,
  });

  factory VideoCommentListElement.fromJson(Map<String, dynamic> json) => VideoCommentListElement(
    id: json["id"],
    uid: json["uid"],
    nickname: json["nickname"],
    content: json["content"],
    replyCount: json["reply_count"],
    likeCount: json["like_count"],
    createdAt: json["created_at"],
    commentType: json["comment_type"],
    status: json["status"],
    avatar: json["avatar"],
    grade: json["grade"],
    isUpvote: json["is_upvote"] ?? false,
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "nickname": nickname,
    "content": content,
    "reply_count": replyCount,
    "like_count": likeCount,
    "created_at": createdAt,
    "comment_type": commentType,
    "status": status,
    "avatar": avatar,
    "grade": grade,
    "is_upvote": isUpvote,
  };
}
