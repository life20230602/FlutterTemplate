import 'package:flutter/material.dart';
import 'package:flutter_se/base/widget/loading_layout.dart';
import 'package:flutter_se/page/splash/widget/coung_down_widget.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/route/route_utils.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/component/ad_common_widget.dart';
import 'package:get/get.dart';

import '../../base/page/app_getx_base_page.dart';
import 'splash_logic.dart';

///欢迎页面
class SplashPage extends AppGetXBasePage<SplashLogic> {
  SplashPage({super.key});

  @override
  bool showLoadingPage() {
    return false;
  }

  @override
  bool enableTopSafeArea() {
    return false;
  }

  @override
  bool showTitle() {
    return false;
  }

  @override
  Widget buildChild(BuildContext context) {
    return Obx(
      () => Stack(
        fit: StackFit.expand,
        children: [
          if (logic.launchAdList.isEmpty)
            Positioned.fill(
              child:
                  AppAsset.assets.imagesMainBottomIcon1Default
                      .toAssetImageWidget(),
            ),
          if (logic.configSuccessObs.isFalse) _buildBottom(context),
          if (logic.launchAdList.isNotEmpty) _buildLaunchAd(),
          if (logic.configSuccessObs.isTrue) _buildCountDown(),
        ],
      ),
    );
  }

  ///倒计时
  Widget _buildCountDown() {
    //可以开始加载首页
    Future.delayed(const Duration(seconds: 1), () {
      RouteUtils.toMain();
    });
    return Positioned(
      right: 16,
      top: 20,
      child: SafeArea(
        child: CountDownTimeWidget(
          countDownTime: 5,
          onClick: () {
            //加载完成
            RouteUtils.toLogin();
          },
        ),
      ),
    );
  }

  ///启动广告
  Widget _buildLaunchAd() {
    return Positioned.fill(
      child: AdBannerWidget(adList: logic.launchAdList, adHeight: 0),
    );
  }

  ///底部提示文案
  Widget _buildBottom(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 60),
        height: 60,
        color: Colors.black.withOpacity(0.3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20, height: 20, child: loadingWidget(context)),
            const SizedBox(width: 10),
            _buildLineText(),
          ],
        ),
      ),
    );
  }

  Widget _buildLineText() {
    return Obx(
      () => Text(
        logic.lineTextObs.value,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  SplashLogic createController() {
    return SplashLogic();
  }
}
