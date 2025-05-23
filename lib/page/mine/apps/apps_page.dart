import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mine/apps/apps_logic.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/component/ad_common_widget.dart';
import 'package:flutter_se/widget/component/app_button_widget.dart';

/// 应用推荐
class AppsPage extends AppGetXBasePage<AppsLogic> {
  AppsPage({super.key});

  @override
  AppsLogic createController() => AppsLogic();

  @override
  String title() => "应用推荐";

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          AdBannerWidget(),
          const SizedBox(height: 20),
          Text(
            "大家都在玩",
            style: TextStyle(fontSize: 20, color: Colors.white),
            strutStyle: StrutStyle(forceStrutHeight: true),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return _buildItem(index);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 15);
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(int index) {
    return Row(
      children: [
        AppAsset.assets.imagesIconMineShare.toAssetImageWidget(
          size: 60,
          radius: 13,
        ),
        const SizedBox(width: 9),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "名字",
                style: TextStyle(fontSize: 16, color: Colors.white),
                strutStyle: StrutStyle(forceStrutHeight: true),
              ),
              const SizedBox(height: 6,),
              Text(
                "下载次数：5112546",
                style: TextStyle(
                  fontSize: 12,
                  color: context.appTheme.secondTextColor,
                ),
                strutStyle: StrutStyle(forceStrutHeight: true),
              ),
              const SizedBox(height: 6,),
              Text(
                "APP描述APP描述",
                style: TextStyle(
                  fontSize: 12,
                  color: context.appTheme.secondTextColor,
                ),
                strutStyle: StrutStyle(forceStrutHeight: true),
              ),
            ],
          ),
        ),
        AppButtonWidget(text: "下载", height: 30, width: 70),
      ],
    );
  }
}
