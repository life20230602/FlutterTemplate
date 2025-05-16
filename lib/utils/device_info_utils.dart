import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_se/utils/cache_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uuid/uuid.dart';

import 'decrypt_utils.dart';

class DeviceInfo {
  static const _cacheKey = "cache_device_id";

  ///获取设备ID
  static Future<String> getDeviceId() async {
    var deviceId = CacheUtils.getString(_cacheKey);
    if (deviceId != null) return deviceId;
    deviceId = DecryptUtils.md5Encode(Uuid().v4());
    CacheUtils.putString(_cacheKey, deviceId);
    return Future.value(deviceId);
  }

  ///获取设备描述信息
  static Future<String> getDeviceDesc() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    String deviceDesc = "";
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionInfo = packageInfo.version + packageInfo.buildNumber;
    if (kIsWeb) {
      WebBrowserInfo browserInfo = await deviceInfoPlugin.webBrowserInfo;
      return Future.value("${browserInfo.userAgent}");
    }
    if(Platform.isAndroid){
      AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
      deviceDesc = info.brand + info.model + versionInfo;
      return Future.value(deviceDesc);
    }
    if(Platform.isIOS){
      IosDeviceInfo info = await deviceInfoPlugin.iosInfo;
      deviceDesc = info.name + info.model + versionInfo;
      return Future.value(deviceDesc);
    }
    if(Platform.isMacOS){
      MacOsDeviceInfo info = await deviceInfoPlugin.macOsInfo;
      deviceDesc = info.modelName + info.model + versionInfo;
      return Future.value(deviceDesc);
    }
    if(Platform.isWindows){
      WindowsDeviceInfo info = await deviceInfoPlugin.windowsInfo;
      deviceDesc = info.productName + info.computerName + versionInfo;
      return Future.value(deviceDesc);
    }
    final deviceInfo = await deviceInfoPlugin.iosInfo;
    return Future.value("${deviceInfo.data}");
  }

  ///获取版本号
  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return Future.value(packageInfo.version);
  }

  ///获取包名
  static Future<String> getPackageName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return Future.value(packageInfo.packageName);
  }

  /// 判断是否为uc浏览器
  static Future<bool> isUcBrowser() async {
    if (!kIsWeb) {
      return Future.value(false);
    }
    final deviceInfoPlugin = DeviceInfoPlugin();
    WebBrowserInfo browserInfo = await deviceInfoPlugin.webBrowserInfo;
    return Future.value((browserInfo.userAgent ?? "").contains("UCBrowser"));
  }

  /// 判断是否为Safari浏览器
  static Future<bool> isSafariBrowser() async {
    if (!kIsWeb) {
      return Future.value(false);
    }
    final deviceInfoPlugin = DeviceInfoPlugin();
    WebBrowserInfo browserInfo = await deviceInfoPlugin.webBrowserInfo;
    var userAgent = browserInfo.userAgent ?? "";
    return Future.value(
        userAgent.contains("Safari") && !userAgent.contains("Chrome"));
  }

  ///获取系统名称
  static String getOsName() {
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        return 'android'; //系统名称
      } else if (Platform.isIOS) {
        return 'ios'; //系统名称
      }
    }
    return "h5";
  }
}
