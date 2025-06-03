import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/ai/strip/strip_logic.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/widget_utils.dart';
import 'package:get/get.dart';

import '../../../widget/component/app_title_right_button_widget.dart';

///脱衣
class StripPage extends AppGetXBasePage<StripLogic> {
  StripPage({super.key});

  @override
  StripLogic createController() => StripLogic();

  @override
  String title() => "Ai脱衣";

  @override
  List<Widget>? titleActions() {
    return [
      AppTitleRightButtonWidget(
        text: "作品记录",
        onTap: (){},
      ),
    ];
  }

  @override
  Widget buildChild(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Text("请选择制作方向", style: TextStyle(fontSize: 16, color: Colors.white)),
          const SizedBox(height: 10),
          SizedBox(height: 110, child: _buildMakeDirection()),
          _buildImageArea(),
          const SizedBox(height: 15),
          toAppButton("立即制作", onTap: logic.submit),
          const SizedBox(height: 15),
          Center(child: _buildCoinTip()),
          const SizedBox(height: 10),
          Text("案例展示", style: TextStyle(fontSize: 17, color: Colors.white)),
          const SizedBox(height: 6),
          SizedBox(
            height: 230,
            child: Row(
              children: [
                _buildCase(AppAsset.assets.imagesIconAiStripSource),
                const SizedBox(width: 10),
                _buildCase(AppAsset.assets.imagesIconAiStripDest),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCase(String image) {
    return AspectRatio(
      aspectRatio: 340 / 460,
      child: image.toAssetImageWidget(radius: 10),
    );
  }

  ///金币消耗提示
  Widget _buildCoinTip() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("消耗金币：", style: TextStyle(fontSize: 14, color: Colors.white)),
        AppAsset.assets.imagesIconCoin.toAssetImageWidget(size: 16),
        const SizedBox(width: 5),
        Text("20个金币或次数 1", style: TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }

  ///图片区域
  Widget _buildImageArea() {
    return AspectRatio(
      aspectRatio: 700 / 310,
      child: GestureDetector(
        onTap: () {
          logic.pickerImage();
        },
        child: Container(
          decoration: BoxDecoration(
            color: context.appTheme.secondBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Obx(() => _buildImage(logic.taskImageObs.value)),
        ),
      ),
    );
  }

  Widget _buildImage(String url) {
    if (url.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            radius: Radius.circular(10),
            color: Color(0xFF313131),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppAsset.assets.imagesIconImageHolder.toAssetImageWidget(
                  size: 41,
                ),
                Text(
                  "上传图片",
                  style: TextStyle(
                    fontSize: 14,
                    color: context.appTheme.appGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.file(File(url), fit: BoxFit.cover),
    );
  }

  ///选择制作方向
  Widget _buildMakeDirection() {
    return Obx(
      () => ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              logic.templateIndexObs.value = index;
            },
            child: _buildMakeDirectionItem(index),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 12);
        },
        itemCount: logic.templateListObs.length,
      ),
    );
  }

  Widget _buildMakeDirectionItem(int index) {
    return Column(
      children: [
        Obx(
          () => SizedBox(
            width: 61,
            height: 61,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (index == logic.templateIndexObs.value)
                  Container(
                    width: 61,
                    height: 61,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [Color(0xFF2FCCF7), Color(0xFF00DF39)],
                      ),
                    ),
                  ),
                AppAsset.assets.imagesIconMineShare.toAssetImageWidget(
                  size: 60,
                  radius: 30,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text("脱光光", style: TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }
}
