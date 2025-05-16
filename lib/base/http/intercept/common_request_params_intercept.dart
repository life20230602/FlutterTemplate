import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_se/http/rest_api_manager.dart';
import 'package:flutter_se/utils/decrypt_utils.dart';

///公共参数统一添加,post 请求
class CommonRequestParamsIntercept extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //只加密post参数
    if (options.method.toLowerCase() == "post") {
      ApiManager.createRequestBody().then((value) {
        if (options.data is FormData) {
          List<MapEntry<String, dynamic>> shareParams =
              value.entries.map((entry) {
            return MapEntry(entry.key, entry.value);
          }).toList();
          if (options.data == null) {
            options.data = shareParams;
          } else {
            options.data.fields.addAll(FormData.fromMap(value).fields);
          }
        } else {
          if (options.data == null) {
            options.contentType = Headers.jsonContentType;
            options.data = value;
          } else if (options.data is Map) {
            (options.data as Map).addAll(value);
          }
        }
        handler.next(options);
      });
    } else {
      handler.next(options);
    }
  }
}
