
import 'package:flutter_se/bean/page_bean.dart';

class VideoListBean {
  List<VideoListElement> list;
  Page page;

  VideoListBean({
    required this.list,
    required this.page,
  });

  factory VideoListBean.fromJson(Map<String, dynamic> json) => VideoListBean(
        list: List<VideoListElement>.from(json["list"].map((x) => VideoListElement.fromJson(x))),
        page: Page.fromJson(json["page"]),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "page": page.toJson(),
      };
}

class VideoListElement {
  int id;
  String salePrice;
  int permissionType; //1 VIP,2免费,3购买,4,活动
  String desc;
  String title;
  String horizontalCover;
  int videoLength;
  int favoriteCount;
  int commentCount;
  int upvoteCount;
  int clickCount;
  int uploader;
  int createdAt;
  String uploaderName;
  String uploaderAvatar;
  bool adv;
  bool isCollect; //是否关注
  bool isUpvote; //是否点赞
  bool isFocus; //是否关注
  String jumpUri;
  int jumpType;
  bool permissions; //是否购买成功，可以播放
  List<VideoTag>? tags;

  VideoListElement({
    required this.id,
    required this.salePrice,
    required this.permissionType,
    required this.desc,
    required this.title,
    required this.horizontalCover,
    required this.videoLength,
    required this.favoriteCount,
    required this.commentCount,
    required this.upvoteCount,
    required this.clickCount,
    required this.uploader,
    required this.createdAt,
    required this.uploaderName,
    required this.uploaderAvatar,
    required this.adv,
    required this.jumpUri,
    required this.jumpType,
    required this.permissions,
    required this.tags,
    required this.isCollect,
    required this.isUpvote,
    required this.isFocus,
  });

  factory VideoListElement.fromJson(Map<String, dynamic> json) => VideoListElement(
        id: json["id"],
        salePrice: json["sale_price"] ?? "",
        permissionType: json["permission_type"] ?? "",
        desc: json["desc"] ?? "",
        title: json["title"] ?? "",
        horizontalCover: json["horizontal_cover"] ?? "",
        videoLength: json["video_length"] ?? 0,
        favoriteCount: json["favorite_count"] ?? 0,
        commentCount: json["comment_count"] ?? 0,
        upvoteCount: json["upvote_count"] ?? 0,
        clickCount: json["click_count"] ?? 0,
        uploader: json["uploader"] ?? 0,
        createdAt: json["created_at"] ?? 0,
        uploaderName: json["uploader_name"] ?? "",
        uploaderAvatar: json["uploader_avatar"] ?? "",
        adv: json["adv"],
        isCollect: json["is_collect"] ?? false,
        isUpvote: json["is_upvote"] ?? false,
        isFocus: json["is_focus"] ?? false,
        jumpUri: json["jump_uri"],
        jumpType: json["jump_type"],
        permissions: json["permissions"] ?? false,
        tags: json["tags"] == null ? [] : List<VideoTag>.from(json["tags"]!.map((x) => VideoTag.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sale_price": salePrice,
        "permission_type": permissionType,
        "desc": desc,
        "title": title,
        "horizontal_cover": horizontalCover,
        "video_length": videoLength,
        "favorite_count": favoriteCount,
        "comment_count": commentCount,
        "upvote_count": upvoteCount,
        "click_count": clickCount,
        "uploader": uploader,
        "created_at": createdAt,
        "uploader_name": uploaderName,
        "uploader_avatar": uploaderAvatar,
        "adv": adv,
        "jump_uri": jumpUri,
        "jump_type": jumpType,
        "permissions": permissions,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
      };

  ///是否是免费视频
  bool isFree() {
    return permissionType == 2 || permissions;
  }

  ///是否是VIP
  bool isVIP() {
    return permissionType == 1;
  }

  ///是否需要购买
  bool isBuy() {
    return permissionType == 3;
  }

  bool openAd() {
    if (!adv) {
      return false;
    }
    // jumpUri.openUrl();
    return true;
  }
}

class VideoTag {
  int vid;
  int id;
  String title;

  VideoTag({
    required this.vid,
    required this.id,
    required this.title,
  });

  factory VideoTag.fromJson(Map<String, dynamic> json) => VideoTag(
        vid: json["vid"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "vid": vid,
        "id": id,
        "title": title,
      };
}
