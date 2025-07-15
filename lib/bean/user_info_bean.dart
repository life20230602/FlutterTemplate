// To parse this JSON data, do
//
//     final userInfoBean = userInfoBeanFromJson(jsonString);

import 'dart:convert';

import 'ad_info_bean.dart';

UserInfoBean userInfoBeanFromJson(String str) => UserInfoBean.fromJson(json.decode(str));

String userInfoBeanToJson(UserInfoBean data) => json.encode(data.toJson());

class UserInfoBean {
  int id;
  String nickname;
  dynamic username;
  bool isLogin;
  String avatar;
  dynamic description;
  dynamic channel;
  int vipLevel;
  DateTime vipTime;
  dynamic coins;
  dynamic fans;
  dynamic follow;
  bool isVip;
  int watchCount;
  int residue;
  dynamic likes;
  dynamic up;
  dynamic videos;
  //个人中心轮播广告
  List<AdInfoBean> settingAd;

  UserInfoBean({
    required this.id,
    required this.nickname,
    required this.username,
    required this.isLogin,
    required this.avatar,
    required this.description,
    required this.channel,
    required this.vipLevel,
    required this.vipTime,
    required this.coins,
    required this.fans,
    required this.follow,
    required this.isVip,
    required this.watchCount,
    required this.residue,
    required this.likes,
    required this.up,
    required this.videos,
    required this.settingAd,
  });

  factory UserInfoBean.fromJson(Map<String, dynamic> json) => UserInfoBean(
    id: json["id"],
    nickname: json["nickname"],
    username: json["username"],
    isLogin: json["is_login"],
    avatar: json["avatar"],
    description: json["description"],
    channel: json["channel"],
    vipLevel: json["vip_level"],
    vipTime: DateTime.parse(json["vip_time"]),
    coins: json["coins"],
    fans: json["fans"],
    follow: json["follow"],
    isVip: json["is_vip"],
    watchCount: json["watch_count"],
    residue: json["residue"],
    likes: json["likes"],
    up: json["up"],
    videos: json["videos"],
    settingAd: List<AdInfoBean>.from(json["carousel"].map((x) => AdInfoBean.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nickname": nickname,
    "username": username,
    "is_login": isLogin,
    "avatar": avatar,
    "description": description,
    "channel": channel,
    "vip_level": vipLevel,
    "vip_time": vipTime.toIso8601String(),
    "coins": coins,
    "fans": fans,
    "follow": follow,
    "is_vip": isVip,
    "watch_count": watchCount,
    "residue": residue,
    "likes": likes,
    "up": up,
    "videos": videos,
    "carousel": List<dynamic>.from(settingAd.map((x) => x.toJson())),
  };
}
