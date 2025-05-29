import 'dart:io';
import 'dart:typed_data';

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

import 'diy_face_swap_logic.dart';

///自定义换脸
class DiyFaceSwapPage extends AppGetXBasePage<DiyFaceSwapLogic> {
  DiyFaceSwapPage({super.key});

  @override
  DiyFaceSwapLogic createController() => DiyFaceSwapLogic();

  @override
  String title() => "自定义换脸";

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
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      child: Column(
        children: [
          _buildTitle("请上传任务照片", "建议全身照"),
          const SizedBox(height: 10),
          _buildImageArea(0,logic.taskImageObs),
          const SizedBox(height: 15),
          _buildTitle("请上传脸部照片", "要求五官清晰"),
          const SizedBox(height: 10),
          _buildImageArea(1,logic.faceImageObs),
          const SizedBox(height: 15),
          toAppButton("立即制作",onTap: logic.submit),
          const SizedBox(height: 15),
          _buildCoinTip(),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.topLeft,
            child: Text("注意事项：",style: TextStyle(fontSize: 17,color: Colors.white),),
          ),
          const SizedBox(height: 2),
          Text("1.选择一张人脸清晰，不得有任何遮挡的照片上传；"
            "\n2.照片正面无复杂姿势；"
            "\n3.素材用于AI使用，绝无外传风险，请放心使用。",style: TextStyle(fontSize: 14,color: Colors.white),)
        ],
      ),
    );
  }

  ///金币消耗提示
  Widget _buildCoinTip(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("消耗金币：",style: TextStyle(fontSize: 14,color: Colors.white),),
        AppAsset.assets.imagesIconCoin.toAssetImageWidget(size: 16),
        const SizedBox(width: 5,),
        Text("20个金币或次数 1",style: TextStyle(fontSize: 14,color: Colors.white),),
      ],
    );
  }

  ///图片区域
  Widget _buildImageArea(int type,RxString url) {
    return AspectRatio(
      aspectRatio: 700 / 310,
      child: GestureDetector(
        onTap: (){
          logic.pickerImage(type);
        },
        child: Container(
          decoration: BoxDecoration(
            color: context.appTheme.secondBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Obx(()=>_buildImage(url.value)),
        ),
      ),
    );
  }

  Widget _buildImage(String url) {
    if (url.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppAsset.assets.imagesIconImageHolder.toAssetImageWidget(size: 41),
            Text(
              "上传图片",
              style: TextStyle(fontSize: 14, color: context.appTheme.appGrey),
            ),
          ],
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.file(
        File(url),
        fit: BoxFit.cover,
      ),
    );
  }

  ///标题
  Widget _buildTitle(String title, String desc) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 17, color: Colors.white)),
        const SizedBox(width: 5),
        Text(
          desc,
          style: TextStyle(
            fontSize: 14,
            color: context.appTheme.secondTextColor,
          ),
        ),
      ],
    );
  }
}
