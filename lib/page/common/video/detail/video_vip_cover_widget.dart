import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:get/get.dart';

import '../../../../bean/video_list_item_bean.dart';
import '../../../../res/app_asset.dart';
import '../../../../route/route_utils.dart';



///购买视频回调
typedef OnBuyVideoCallback = void Function(VideoListElement item);

///试看视频
typedef OnTryPlayerVideoCallback = void Function(VideoListElement item);

///视频覆盖
class VideoCoverWidget extends StatelessWidget {
  const VideoCoverWidget(
      {super.key,
      required this.videoItem,
      required this.onBuyVideoCallback,
      required this.onTryPlayerVideoCallback});

  final VideoListElement videoItem;
  final OnBuyVideoCallback? onBuyVideoCallback;
  final OnTryPlayerVideoCallback? onTryPlayerVideoCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.65),
      child: Center(
        child: _buildContent(context),
      ),
    );
  }

  ///构建主体内容
  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "本片位独家合作视频,需付费观看",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        const SizedBox(
          height: 16,
        ),
        // AppAsset.assets.imagesIconVideoBuyBg.toAssetImageWidget(height: 17),
        const SizedBox(
          height: 16,
        ),
        _buildButtons(context),
      ],
    );
  }

  ///创建按钮
  Widget _buildButtons(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: _buildButton("立即试看", null,context.appTheme.whiteColor),
          onTap: () {
            onTryPlayerVideoCallback!(videoItem);
          },
        ),
        const SizedBox(
          width: 30,
        ),
        if (videoItem.isVIP())
          InkWell(
            child: _buildButton("开通会员", context.theme.primaryColor,context.appTheme.primary),
            onTap: () {
              _openVip();
            },
          ),
        if (videoItem.isBuy())
          InkWell(
            child: _buildButton(
                "${videoItem.salePrice}购买", context.theme.primaryColor,context.appTheme.primary),
            onTap: () {
              onBuyVideoCallback!(videoItem);
            },
          ),
      ],
    );
  }

  ///开通会员
  void _openVip() {
    RouteUtils.toVip();
  }

  ///创建单个按钮
  Widget _buildButton(String text, Color? color,Color textColor) {
    return Container(
      width: 84,
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: color ?? Colors.white),
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        text,
        style: TextStyle(fontSize: 13, color: textColor),
      ),
    );
  }
}
