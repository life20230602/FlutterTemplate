// To parse this JSON data, do
//
//     final videoDetailBean = videoDetailBeanFromJson(jsonString);

import 'dart:convert';


import 'package:flutter_se/bean/video_list_item_bean.dart';

import 'ad_info_bean.dart';

VideoDetailBean videoDetailBeanFromJson(String str) => VideoDetailBean.fromJson(json.decode(str));

String videoDetailBeanToJson(VideoDetailBean data) => json.encode(data.toJson());

class VideoDetailBean {
  VideoListElement video;
  bool isCollect;
  List<AdInfoBean> advs;
  List<VideoListElement> suggestion;

  VideoDetailBean({
    required this.video,
    required this.isCollect,
    required this.advs,
    required this.suggestion,
  });

  factory VideoDetailBean.fromJson(Map<String, dynamic> json) => VideoDetailBean(
    video: VideoListElement.fromJson(json["video"]),
    isCollect: json["is_collect"],
    advs: List<AdInfoBean>.from(json["advs"].map((x) => AdInfoBean.fromJson(x))),
    suggestion: List<VideoListElement>.from(json["suggestion"].map((x) => VideoListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "video": video.toJson(),
    "is_collect": isCollect,
    "advs": List<dynamic>.from(advs.map((x) => x.toJson())),
    "suggestion": List<dynamic>.from(suggestion.map((x) => x.toJson())),
  };
}
