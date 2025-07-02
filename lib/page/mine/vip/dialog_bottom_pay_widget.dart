import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/utils/uri_utils.dart';
import 'package:flutter_se/widget/widget_utils.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogBottomPayLogic extends AppGetXBaseLogic {
  ///0表示支付宝 1表示微信
  final payMethodObs = 0.obs;

  @override
  void onLoad() {
    showSuccess();
  }
}

class DialogBottomPay extends AppGetXBasePage<DialogBottomPayLogic> {
  DialogBottomPay({super.key});

  @override
  bool isWidgetMode() => true;

  @override
  DialogBottomPayLogic createController() => DialogBottomPayLogic();

  @override
  Widget buildChild(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
      decoration: BoxDecoration(
        color: context.appTheme.secondBgColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("选择支付方式", style: TextStyle(fontSize: 21, color: Colors.white)),
          const SizedBox(height: 18),
          _buildRow("已开通会员金额", "50元", Colors.white),
          const SizedBox(height: 15),
          _buildRow("升级卡会员金额", "50元", Colors.white),
          const SizedBox(height: 25),
          _buildRow("实际支付差价", "50元", context.appTheme.primary),
          const SizedBox(height: 18),
          _buildPayRow(0, AppAsset.assets.imagesIconAlipay, "支付宝"),
          const SizedBox(height: 15),
          _buildPayRow(1, AppAsset.assets.imagesIconWechat, "微信"),
          const SizedBox(height: 18),
          toAppButton2("立即支付 ¥150",onTap: (){
            preLaunchUrl();
            Future.delayed(Duration(seconds: 2),(){
              "https://baidu.com".openUrl();
            });
            Future.delayed(Duration(seconds: 10),(){
              closePreLaunchUrl();
            });
          }),
        ],
      ),
    );
  }

  Widget _buildPayRow(int index, String icon, String text) {
    return GestureDetector(
      onTap: () {
        logic.payMethodObs.value = index;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Obx(
          () => Row(
            children: [
              icon.toAssetImageWidget(size: 26),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              if (index == logic.payMethodObs.value)
                AppAsset.assets.imagesIconRadioActive.toAssetImageWidget(
                  size: 16,
                )
              else
                AppAsset.assets.imagesIconRadio.toAssetImageWidget(size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String title, String desc, Color color) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: TextStyle(fontSize: 16, color: color)),
        ),
        Text(desc, style: TextStyle(fontSize: 16, color: color)),
      ],
    );
  }
}
