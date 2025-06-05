import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';

import '../../../res/app_asset.dart';

///免费详情头部
class FreeDetailHeadWidget extends StatelessWidget {
  const FreeDetailHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 700 / 270,
      child: Row(
        children: [
          _buildLeftImage(),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(),
                const SizedBox(height: 10),
                _buildTag(),
                const Expanded(child: SizedBox.shrink()),
                _buildLikeAndPlayCount(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///点赞和播放数量
  Widget _buildLikeAndPlayCount(BuildContext context) {
    return Row(
      children: [
        AppAsset.assets.imagesIconLikeHand.toAssetImageWidget(size: 15),
        const SizedBox(width: 2,),
        Text(
          "2564",
          style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
        ),
        const SizedBox(width: 20),
        Text(
          "84534观看",
          style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
        ),
      ],
    );
  }

  ///标签
  Widget _buildTag() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFE7C3), Color(0xFFEFB96F)],
        ),
      ),
      child: const Text(
        "年度观看榜",
        style: TextStyle(fontSize: 13, color: Colors.black),
      ),
    );
  }

  ///标题
  Widget _buildTitle() {
    return const Text(
      "标题最多两行标题最多两行标题最多两行标题最多两行",
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(fontSize: 16, color: Colors.white),
    );
  }

  ///左侧图片
  Widget _buildLeftImage() {
    return AspectRatio(
      aspectRatio: 200 / 270,
      child: AppAsset.assets.imagesIconMineShare.toAssetImageWidget(
        fit: BoxFit.fill,
        radius: 5,
      ),
    );
  }
}
