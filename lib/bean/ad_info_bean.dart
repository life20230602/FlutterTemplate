import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_se/utils/uri_utils.dart';

///广告数据
class AdInfoBean {
  int id;
  String title;
  String androidUrl;
  String iosUrl;
  String h5Url;
  int jump;
  String image;
  String description;

  AdInfoBean({
    required this.id,
    required this.title,
    required this.androidUrl,
    required this.iosUrl,
    required this.h5Url,
    required this.jump,
    required this.image,
    required this.description,
  });

  factory AdInfoBean.fromJson(Map<String, dynamic> json) => AdInfoBean(
        id: json["id"],
        title: json["title"],
        androidUrl: json["android_url"],
        iosUrl: json["ios_url"],
        h5Url: json["h5_url"],
        jump: json["jump"],
        image: json["image"] ?? "",
        description: json["description"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "android_url": androidUrl,
        "ios_url": iosUrl,
        "h5_url": h5Url,
        "jump": jump,
        "image": image,
        "description": description,
      };

  String getOpenUrl() {
    var url = h5Url;
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        url = androidUrl;
      } else {
        url = iosUrl;
      }
    }
    return url;
  }

  void openAd() {
    getOpenUrl().openUrl();
  }
}
