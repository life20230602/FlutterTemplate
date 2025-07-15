// To parse this JSON data, do
//
//     final adInfoBean = adInfoBeanFromJson(jsonString);

import 'dart:convert';

AdInfoBean adInfoBeanFromJson(String str) => AdInfoBean.fromJson(json.decode(str));

String adInfoBeanToJson(AdInfoBean data) => json.encode(data.toJson());

class AdInfoBean {
  int id;
  String title;
  String cover;
  String action;
  String url;
  String description;
  int download;

  AdInfoBean({
    required this.id,
    required this.title,
    required this.cover,
    required this.action,
    required this.url,
    required this.description,
    required this.download,
  });

  factory AdInfoBean.fromJson(Map<String, dynamic> json) => AdInfoBean(
    id: json["id"],
    title: json["title"],
    cover: json["cover"],
    action: json["action"],
    url: json["url"],
    description: json["description"],
    download: json["download"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "cover": cover,
    "action": action,
    "url": url,
    "description": description,
    "download": download,
  };
}
