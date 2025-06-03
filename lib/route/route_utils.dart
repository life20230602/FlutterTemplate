import 'package:flutter_se/page/common/video/detail/video_detail_page.dart';
import 'package:flutter_se/page/launcher/launcher_page.dart';
import 'package:flutter_se/page/mine/vip/vip_page.dart';
import 'package:flutter_se/page/splash/splash_page.dart';
import 'package:get/get.dart';

import '../page/ai/ai_home_page.dart';
import '../page/mine/coin/coin_charge_page.dart';


class RouteUtils {
  static final List<GetPage> pages = [
    GetPage(name: "/", page: () => SplashPage()),
    GetPage(name: "/main", page: () => LauncherPage()),
    GetPage(name: "/ai", page: () => AiHomePage()),
    GetPage(name: "/coin", page: () => CoinChargePage()),
    GetPage(name: "/vip", page: () => VipPage()),
    GetPage(name: "/video/detail", page: () => VideoDetailPage()),
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

  static toAi(){
    Get.toNamed("/ai");
  }

  static toCoinCharge(){
    Get.toNamed("/coin");
  }

  static void toVip() {
    Get.toNamed("/vip");
  }
}
