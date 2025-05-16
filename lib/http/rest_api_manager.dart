import 'package:flutter/foundation.dart';
import 'package:flutter_se/base/http/base_dio.dart';
import 'package:flutter_se/http/rest_api.dart';
import 'package:flutter_se/config/app_config_utils.dart';
import 'package:flutter_se/utils/device_info_utils.dart';
import 'package:flutter_se/config/user_manager_utils.dart';

///api接口管理
class ApiManager {
  static RestClient? _defaultClient;
  static late RestClient _retryClient;
  static late String _defaultBaseUrl;

  ApiManager._internal();

  factory ApiManager() => _instance;

  static final ApiManager _instance = ApiManager._internal();

  //是否需要解密数据
  static const isDecrypt = !kReleaseMode;

  void initClient(String baseUrl) {
    _defaultBaseUrl = baseUrl;
    _retryClient =
        RestClient(dio: BaseDio.getInstance().getRetryDio(), baseUrl: baseUrl);
    _defaultClient = RestClient(baseUrl: baseUrl);
  }

  bool isInit() => _defaultClient != null;

  RestClient getRetryClient() => _retryClient;

  RestClient getDefaultClient() => _defaultClient!;

  ///创建请求公共参数
  static Future<Map<String, dynamic>> createRequestBody() async {
    final map = {
      "uid": UserManager.get().getUserId(),
      "token": UserManager.get().getToken(),
    };
    return map;
  }
}
