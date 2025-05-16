import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_se/base/http/base_http_bean.dart';
import 'package:flutter_se/utils/decrypt_utils.dart';

import '../../../http/rest_api_manager.dart';
import '../exception/app_server_exception.dart';

///结果处理拦截器
class ResultInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200) {
      throw HttpException(response.statusMessage ?? "网络异常");
    }
    // var httpBean = HttpBean.fromJson(response.data);
    // if (!httpBean.isSuccess()) {
    //   if (kDebugMode) {
    //     print("result=>${httpBean.code}====${httpBean.msg}");
    //   }
    //   throw AppServerException(code: httpBean.code, message: httpBean.msg);
    // }
    // //解密数据
    // if (ApiManager.isDecrypt) {
    //   response.data = jsonDecode(httpBean.data.toString().decryptApiData());
    // } else {
    //   response.data = httpBean.data;
    // }
    if (kDebugMode) {
      print("result=>${response.data}");
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.cancel) {
      //如果是取消，异常不再往下传
      return;
    }
    handler.next(err);
  }
}
