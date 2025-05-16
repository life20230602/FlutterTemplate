import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_se/http/rest_api_manager.dart';
import 'package:flutter_se/utils/decrypt_utils.dart';

///请求参数加密
class RequestEncryptIntercept extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //只加密post参数
    if (options.method.toLowerCase() == "post" && options.data != null) {
      if (options.data is! FormData) {
        if (ApiManager.isDecrypt) {
          final data = jsonEncode(options.data).encryptApiData();
          options.data = {"data": data};
        } else {
          options.data = {"data": options.data};
        }
      }
    }
    handler.next(options);
  }
}
