import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'device_info_utils.dart';

class UriUtils {
  ///如果在 web 中存在延迟打开网页的需要需要提前调用此方法。 比如支付场景
  static void preOpenUrl(){
    preLaunchUrl();
  }

  ///通过浏览器打开url
  static void openUrl(String? url) async {
    if (url != null) {
      if (!kIsWeb && Platform.isAndroid) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(Uri.parse(url));
      }
    }
  }
}

extension UriExt on String {
  ///字符串url快速打开
  void openUrl() {
    if (startsWith("http")) {
      UriUtils.openUrl(this);
    } else {
      Get.toNamed(this);
    }
  }
}
