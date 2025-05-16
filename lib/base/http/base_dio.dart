import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/src/adapters/io_adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_se/base/http/intercept/header_intercept.dart';
import 'package:flutter_se/base/http/intercept/result_intercept.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'intercept/common_request_params_intercept.dart';
import 'intercept/request_encrypt_intercept.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';

class BaseDio {
  BaseDio._(); // 把构造方法私有化

  static BaseDio? _instance;

  Dio? _defaultDio;

  Dio? _retryDio;

  static BaseDio getInstance() {
    // 通过 getInstance 获取实例
    _instance ??= BaseDio._();
    return _instance!;
  }

  Dio _newDio(bool retry) {
    Dio dio = Dio();
    dio.options = BaseOptions(
        receiveTimeout: const Duration(milliseconds: 25000),
        sendTimeout: const Duration(milliseconds: 25000),
        connectTimeout: const Duration(milliseconds: 10000)); // 设置超时时间等 ...
    // 忽略 https 证书校验
    if (dio.httpClientAdapter is IOHttpClientAdapter) {
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.idleTimeout = const Duration(seconds: 30);
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    dio.options.responseType = ResponseType.plain;
    dio.interceptors.add(HeaderInterceptor()); // 添加拦截器，如 token之类，需要全局使用的参数
    dio.interceptors.add(CommonRequestParamsIntercept());
    // dio.interceptors.add(RequestEncryptIntercept());
    //重试
    if (retry) {
      dio.interceptors.add(RetryInterceptor(
          dio: dio,
          logPrint: (String message) {},
          toNoInternetPageNavigator: () async {}));
    }
    dio.interceptors.add(ResultInterceptor());
    if (kDebugMode) {
      // 输出参数
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
    }
    return dio;
  }

  Dio getDefaultDio() {
    if (_defaultDio != null) {
      return _defaultDio!;
    }
    _defaultDio = _newDio(false);
    return _defaultDio!;
  }

  ///支持重试的dio
  Dio getRetryDio() {
    if (_retryDio != null) {
      return _retryDio!;
    }
    return _retryDio = _newDio(true);
  }

  Dio getPingDio() {
    final dio = Dio();
    dio.options = BaseOptions(
        receiveTimeout: const Duration(milliseconds: 5000),
        connectTimeout: const Duration(milliseconds: 5000)); // 设置超时时间等 ...
    if (dio.httpClientAdapter is IOHttpClientAdapter) {
      // 忽略 https 证书校验
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    return dio;
  }
}
