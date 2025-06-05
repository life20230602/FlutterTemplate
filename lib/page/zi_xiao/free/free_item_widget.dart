import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/page/zi_xiao/free/free_detail_logic.dart';
import 'package:flutter_se/page/zi_xiao/free/free_detail_page.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/widget_utils.dart';
import 'package:get/get.dart';

///免费看片 item
class FreeItemWidget extends StatelessWidget {
  const FreeItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImage(),
        const SizedBox(height: 10),
        const Text("视频名称", style: TextStyle(fontSize: 14, color: Colors.white)),
        _buildDesc(context),
        const SizedBox(height: 15),
        toAppButton(
          "观看正片",
          textSize: 14,
          onTap: () {
            Get.to(FreeDetailPage());
          },
        ),
      ],
    );
  }

  ///描述区域
  Widget _buildDesc(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "2023年/古装",
          style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
        ),
        Text(
          "1264人点赞",
          style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
        ),
        Text(
          "已有621人购买全集",
          style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
        ),
      ],
    );
  }

  ///图片
  Widget _buildImage() {
    return SizedBox(
      height: 135,
      child: Row(
        children: [
          AppAsset.assets.imagesIconMineShare.toAssetImageWidget(
            radius: 5,
            height: 135,
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: AppAsset.assets.imagesIconMineShare.toAssetImageWidget(
              radius: 5,
              fit: BoxFit.fill,
              height: 135,
            ),
          ),
        ],
      ),
    );
  }
}
