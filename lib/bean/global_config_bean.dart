import 'ad_info_bean.dart';

///全局配置
class GlobalConfigBean {
  List<Config> config;
  List<AdInfoBean> launchAdv;
  List<AdInfoBean> popAdv;
  List<AdInfoBean> searchAdv;
  List<SystemAnnouncement> systemAnnouncement;

  GlobalConfigBean({
    required this.config,
    required this.launchAdv,
    required this.popAdv,
    required this.searchAdv,
    required this.systemAnnouncement,
  });

  GlobalConfigBean copyWith({
    List<Config>? config,
    List<AdInfoBean>? launchAdv,
    List<AdInfoBean>? popAdv,
    List<AdInfoBean>? searchAdv,
    List<SystemAnnouncement>? systemAnnouncement,
  }) =>
      GlobalConfigBean(
        config: config ?? this.config,
        launchAdv: launchAdv ?? this.launchAdv,
        popAdv: popAdv ?? this.popAdv,
        searchAdv: searchAdv ?? this.searchAdv,
        systemAnnouncement: systemAnnouncement ?? this.systemAnnouncement,
      );

  factory GlobalConfigBean.fromJson(Map<String, dynamic> json) =>
      GlobalConfigBean(
        config:
            List<Config>.from(json["config"].map((x) => Config.fromJson(x))),
        launchAdv: List<AdInfoBean>.from(
            json["launch_adv"].map((x) => AdInfoBean.fromJson(x))),
        popAdv: List<AdInfoBean>.from(
            json["pop_adv"].map((x) => AdInfoBean.fromJson(x))),
        searchAdv: List<AdInfoBean>.from(
            json["search_adv"].map((x) => AdInfoBean.fromJson(x))),
        systemAnnouncement: List<SystemAnnouncement>.from(
            json["system_announcement"]
                .map((x) => SystemAnnouncement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "config": List<dynamic>.from(config.map((x) => x.toJson())),
        "launch_adv": List<dynamic>.from(launchAdv.map((x) => x.toJson())),
        "pop_adv": List<dynamic>.from(popAdv.map((x) => x.toJson())),
        "search_adv": List<dynamic>.from(searchAdv.map((x) => x)),
        "system_announcement":
            List<dynamic>.from(systemAnnouncement.map((x) => x.toJson())),
      };
}

class Config {
  String key;
  String value;
  String desc;

  Config({
    required this.key,
    required this.value,
    required this.desc,
  });

  Config copyWith({
    String? key,
    String? value,
    String? desc,
  }) =>
      Config(
        key: key ?? this.key,
        value: value ?? this.value,
        desc: desc ?? this.desc,
      );

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        key: json["key"],
        value: json["value"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "desc": desc,
      };
}

class SystemAnnouncement {
  int id;
  String title;
  String content;

  SystemAnnouncement({
    required this.id,
    required this.title,
    required this.content,
  });

  SystemAnnouncement copyWith({
    int? id,
    String? title,
    String? content,
  }) =>
      SystemAnnouncement(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
      );

  factory SystemAnnouncement.fromJson(Map<String, dynamic> json) =>
      SystemAnnouncement(
        id: json["id"],
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
      };
}
