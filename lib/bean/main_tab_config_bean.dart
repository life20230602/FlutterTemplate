// To parse this JSON data, do
//
//     final homeTabDataBean = homeTabDataBeanFromJson(jsonString);

import 'ad_info_bean.dart';

///首页每个 tab 项对应数据
class MainTabConfigBean {
  //母淫 tab
  List<MainTabItemBean> winnow;
  //社区/狼窝 tab
  List<CircleItemBean> circle;
  //子笑 tab
  List<MainTabItemBean> dark;
  //消费金额
  int payed;

  MainTabConfigBean({
    required this.winnow,
    required this.circle,
    required this.dark,
    required this.payed,
  });

  factory MainTabConfigBean.fromJson(Map<String, dynamic> json) =>
      MainTabConfigBean(
        winnow: List<MainTabItemBean>.from(json["winnow"].map((x) => MainTabItemBean.fromJson(x))),
        circle: List<CircleItemBean>.from(
          json["circle"].map((x) => CircleItemBean.fromJson(x)),
        ),
        dark: List<MainTabItemBean>.from(json["dark"].map((x) => MainTabItemBean.fromJson(x))),
        payed: json["payed"],
      );

  Map<String, dynamic> toJson() => {
    "winnow": List<MainTabItemBean>.from(winnow.map((x) => x.toJson())),
    "circle": List<CircleItemBean>.from(circle.map((x) => x.toJson())),
    "dark": List<MainTabItemBean>.from(dark.map((x) => x.toJson())),
    "payed": payed,
  };
}

///圈子配置
class CircleItemBean {
  int id;
  int type;
  String name;
  String age;
  String describe;
  int subject;
  int arr;
  String img;
  bool enter;
  String banner;
  List<AdInfoBean> carousel;
  List<dynamic> ranking;
  List<dynamic> users;
  List<CircleTag> tags;

  CircleItemBean({
    required this.id,
    required this.type,
    required this.name,
    required this.age,
    required this.describe,
    required this.subject,
    required this.arr,
    required this.img,
    required this.enter,
    required this.banner,
    required this.carousel,
    required this.ranking,
    required this.users,
    required this.tags,
  });

  factory CircleItemBean.fromJson(Map<String, dynamic> json) => CircleItemBean(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    age: json["age"],
    describe: json["describe"],
    subject: json["subject"],
    arr: json["arr"],
    img: json["img"],
    enter: json["enter"],
    banner: json["banner"],
    carousel: List<AdInfoBean>.from(
      json["carousel"].map((x) => AdInfoBean.fromJson(x)),
    ),
    ranking: List<dynamic>.from(json["ranking"].map((x) => x)),
    users: List<dynamic>.from(json["users"].map((x) => x)),
    tags: List<CircleTag>.from(json["tags"].map((x) => CircleTag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "age": age,
    "describe": describe,
    "subject": subject,
    "arr": arr,
    "img": img,
    "enter": enter,
    "banner": banner,
    "carousel": List<AdInfoBean>.from(carousel.map((x) => x.toJson())),
    "ranking": List<dynamic>.from(ranking.map((x) => x)),
    "users": List<dynamic>.from(users.map((x) => x)),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
  };
}

class CircleTag {
  int id;
  String tag;
  String img;
  dynamic description;

  CircleTag({
    required this.id,
    required this.tag,
    required this.img,
    required this.description,
  });

  factory CircleTag.fromJson(Map<String, dynamic> json) => CircleTag(
    id: json["id"],
    tag: json["tag"],
    img: json["img"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tag": tag,
    "img": img,
    "description": description,
  };
}

class MainTabItemBean {
  int id;
  int type;
  String name;
  String age;
  String describe;
  int subject;
  int arr;
  String img;
  bool enter;
  String banner;
  List<AdInfoBean> carousel;
  List<dynamic> ranking;
  List<dynamic> users;
  List<DarkTag> tags;

  MainTabItemBean({
    required this.id,
    required this.type,
    required this.name,
    required this.age,
    required this.describe,
    required this.subject,
    required this.arr,
    required this.img,
    required this.enter,
    required this.banner,
    required this.carousel,
    required this.ranking,
    required this.users,
    required this.tags,
  });

  factory MainTabItemBean.fromJson(Map<String, dynamic> json) => MainTabItemBean(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    age: json["age"],
    describe: json["describe"],
    subject: json["subject"],
    arr: json["arr"],
    img: json["img"],
    enter: json["enter"],
    banner: json["banner"],
    carousel: List<AdInfoBean>.from(
      json["carousel"].map((x) => AdInfoBean.fromJson(x)),
    ),
    ranking: List<dynamic>.from(json["ranking"].map((x) => x)),
    users: List<dynamic>.from(json["users"].map((x) => x)),
    tags: List<DarkTag>.from(json["tags"].map((x) => DarkTag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "age": age,
    "describe": describe,
    "subject": subject,
    "arr": arr,
    "img": img,
    "enter": enter,
    "banner": banner,
    "carousel": List<AdInfoBean>.from(carousel.map((x) => x.toJson())),
    "ranking": List<dynamic>.from(ranking.map((x) => x)),
    "users": List<dynamic>.from(users.map((x) => x)),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
  };
}

class DarkTag {
  int id;
  String tag;

  DarkTag({required this.id, required this.tag});

  factory DarkTag.fromJson(Map<String, dynamic> json) =>
      DarkTag(id: json["id"], tag: json["tag"]);

  Map<String, dynamic> toJson() => {"id": id, "tag": tag};
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
