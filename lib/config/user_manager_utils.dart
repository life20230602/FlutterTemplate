import 'dart:convert';

import 'package:flutter_se/bean/user_info_bean.dart';
import 'package:flutter_se/route/route_utils.dart';
import 'package:flutter_se/utils/cache_utils.dart';

class UserManager {
  final _KEY = "key_user_info";

  UserManager._internal();

  factory UserManager() => _instance;

  static final UserManager _instance = UserManager._internal();

  static UserInfoBean? _userInfoBean;

  static UserManager get() => _instance;

  void login(UserInfoBean bean) {
    _userInfoBean = bean;
    CacheUtils.putString(_KEY, jsonEncode(bean.toJson()));
  }

  void _checkLogin() {
    if (_userInfoBean == null) {
      var string = CacheUtils.getString(_KEY);
      if (string != null) {
        _userInfoBean = UserInfoBean.fromJson(jsonDecode(string));
      }
    }
  }

  get isLogin {
    _checkLogin();
    return _userInfoBean != null;
  }

  String getUserId() {
    _checkLogin();
    return _userInfoBean != null ? _userInfoBean!.id.toString() : "";
  }

  String getAvatar() {
    _checkLogin();
    return _userInfoBean != null ? _userInfoBean!.avatar : "";
  }

  UserInfoBean getUserInfo() {
    _checkLogin();
    return _userInfoBean!;
  }

  bool isVip(){
    return false;
  }
}
