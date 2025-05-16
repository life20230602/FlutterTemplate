// To parse this JSON data, do
//
//     final userInfoBean = userInfoBeanFromJson(jsonString);

import 'dart:convert';

UserInfoBean userInfoBeanFromJson(String str) => UserInfoBean.fromJson(json.decode(str));

String userInfoBeanToJson(UserInfoBean data) => json.encode(data.toJson());

/// 用户信息
class UserInfoBean {
  String uid;
  String appId;
  String name;
  String username;
  int sex;
  String category;
  String shortNo;
  String zone;
  String phone;
  String token;
  String chatPwd;
  String lockScreenPwd;
  int lockAfterMinute;
  UserSetting setting;
  String rsaPublicKey;
  int shortStatus;
  int msgExpireSecond;
  String avatar;

  UserInfoBean({
    required this.uid,
    required this.appId,
    required this.name,
    required this.username,
    required this.sex,
    required this.category,
    required this.shortNo,
    required this.zone,
    required this.phone,
    required this.token,
    required this.chatPwd,
    required this.lockScreenPwd,
    required this.lockAfterMinute,
    required this.setting,
    required this.rsaPublicKey,
    required this.shortStatus,
    required this.msgExpireSecond,
    required this.avatar,
  });

  factory UserInfoBean.fromJson(Map<String, dynamic> json) => UserInfoBean(
    uid: json["uid"],
    appId: json["app_id"],
    name: json["name"],
    username: json["username"],
    sex: json["sex"],
    category: json["category"],
    shortNo: json["short_no"],
    zone: json["zone"],
    phone: json["phone"],
    token: json["token"],
    chatPwd: json["chat_pwd"],
    lockScreenPwd: json["lock_screen_pwd"],
    lockAfterMinute: json["lock_after_minute"],
    setting: UserSetting.fromJson(json["setting"]),
    rsaPublicKey: json["rsa_public_key"],
    shortStatus: json["short_status"],
    msgExpireSecond: json["msg_expire_second"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "app_id": appId,
    "name": name,
    "username": username,
    "sex": sex,
    "category": category,
    "short_no": shortNo,
    "zone": zone,
    "phone": phone,
    "token": token,
    "chat_pwd": chatPwd,
    "lock_screen_pwd": lockScreenPwd,
    "lock_after_minute": lockAfterMinute,
    "setting": setting.toJson(),
    "rsa_public_key": rsaPublicKey,
    "short_status": shortStatus,
    "msg_expire_second": msgExpireSecond,
    "avatar": avatar,
  };
}

class UserSetting {
  int searchByPhone;
  int searchByShort;
  int newMsgNotice;
  int msgShowDetail;
  int voiceOn;
  int shockOn;
  int offlineProtection;
  int deviceLock;
  int muteOfApp;

  UserSetting({
    required this.searchByPhone,
    required this.searchByShort,
    required this.newMsgNotice,
    required this.msgShowDetail,
    required this.voiceOn,
    required this.shockOn,
    required this.offlineProtection,
    required this.deviceLock,
    required this.muteOfApp,
  });

  factory UserSetting.fromJson(Map<String, dynamic> json) => UserSetting(
    searchByPhone: json["search_by_phone"],
    searchByShort: json["search_by_short"],
    newMsgNotice: json["new_msg_notice"],
    msgShowDetail: json["msg_show_detail"],
    voiceOn: json["voice_on"],
    shockOn: json["shock_on"],
    offlineProtection: json["offline_protection"],
    deviceLock: json["device_lock"],
    muteOfApp: json["mute_of_app"],
  );

  Map<String, dynamic> toJson() => {
    "search_by_phone": searchByPhone,
    "search_by_short": searchByShort,
    "new_msg_notice": newMsgNotice,
    "msg_show_detail": msgShowDetail,
    "voice_on": voiceOn,
    "shock_on": shockOn,
    "offline_protection": offlineProtection,
    "device_lock": deviceLock,
    "mute_of_app": muteOfApp,
  };
}
