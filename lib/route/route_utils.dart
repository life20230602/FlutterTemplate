import 'package:flutter_se/page/launcher/launcher_page.dart';
import 'package:flutter_se/page/splash/splash_page.dart';
import 'package:get/get.dart';


class RouteUtils {
  static final List<GetPage> pages = [
    GetPage(name: "/", page: () => SplashPage()),
    GetPage(name: "/main", page: () => LauncherPage()),
  ];

  static toSplash() {
    Get.offAllNamed("/");
  }

  static toLogin() {
    Get.offAllNamed("/login");
  }

  static toMain() {
    Get.offAllNamed("/main");
  }
}
