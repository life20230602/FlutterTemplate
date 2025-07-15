import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_se/utils/device_info_utils.dart';
import 'package:flutter_se/config/user_manager_utils.dart';

///请求头添加
class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final headers = options.headers;
    final deviceId = await DeviceInfo.getDeviceId();
    final appVersion = await DeviceInfo.getAppVersion();
    headers['package'] = await DeviceInfo.getPackageName();
    headers['devid'] = deviceId;
    headers['version'] = appVersion;
    headers['model'] = await DeviceInfo.getDeviceDesc();
    if (kIsWeb) {
      headers['os'] = 'h5'; //系统名称
    } else {
      if (Platform.isAndroid) {
        headers['os'] = 'android'; //系统名称
      } else if (Platform.isIOS) {
        headers['os'] = 'ios'; //系统名称
      }
    }

    options.headers = headers;
    handler.next(options);
  }
}
