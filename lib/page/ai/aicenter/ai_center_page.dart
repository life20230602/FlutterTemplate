import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/ai/strip/strip_logic.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/component/ad_common_widget.dart';
import 'package:flutter_se/widget/widget_utils.dart';

import '../../../res/app_asset.dart';
import '../widget/ai_center_head_widget.dart';
import 'ai_center_logic.dart';

///ai中心
class AiCenterPage extends AppGetXBasePage<AiCenterLogic> {
  AiCenterPage({super.key});

  @override
  AiCenterLogic createController() => AiCenterLogic();

  @override
  String title() => "Ai中心";

  @override
  List<Widget>? titleActions() {
    return [
      Text(
        "作品记录",
        strutStyle: StrutStyle(forceStrutHeight: true),
        style: TextStyle(fontSize: 15, color: context.appTheme.titleTextColor),
      ),
    ];
  }

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Column(
        children: [
          AiCenterHeadWidget(),
          const SizedBox(height: 20),
          _buildAmountInfo(),
          const SizedBox(height: 15),
          _buildBanner(),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildButton("交易记录", (){})),
              const SizedBox(width: 10),
              Expanded(child: _buildButton("作品记录", (){})),
            ],
          )
        ],
      ),
    );
  }

  ///按钮
  Widget _buildButton(String text,Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.appTheme.secondBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text,
          style: TextStyle(fontSize: 16, color: context.appTheme.secondTextColor),
        ),
      ),
    );
  }

  ///轮播
  Widget _buildBanner() {
    return AdBannerWidget();
  }

  ///构建余额信息
  Widget _buildAmountInfo() {
    return AspectRatio(
      aspectRatio: 700 / 300,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        decoration: BoxDecoration(
          color: context.appTheme.secondBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Text(
              "金币余额",
              style: TextStyle(
                fontSize: 15,
                color: context.appTheme.whiteColor,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppAsset.assets.imagesIconCoin.toAssetImageWidget(size: 20),
                  const SizedBox(width: 5),
                  Text(
                    "0.00",
                    style: TextStyle(fontSize: 42, color: Colors.white),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(width: 100, child: toAppButton2("立即充值")),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "此金额仅可用于AI消费",
                style: TextStyle(
                  color: context.appTheme.secondTextColor,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
