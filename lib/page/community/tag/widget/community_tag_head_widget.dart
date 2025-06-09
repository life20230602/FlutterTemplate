import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';

import '../../../../res/app_asset.dart';

///社区标签详情-头部
class CommunityTagHeadWidget extends StatelessWidget {
  const CommunityTagHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 700 / 200,
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
                _buildTag(context),
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
        Text(
          "2847个贴子",
          style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
        ),
        const SizedBox(width: 20),
        Text(
          "3770",
          style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
        ),
      ],
    );
  }

  ///标签
  Widget _buildTag(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// 点击关注 or 取消关注
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 7),
        decoration: BoxDecoration(
          border: Border.all(color: context.appTheme.primary, width: 1.0),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Text(
          /*item.followStateObs.value == 0 ? '+ 关注' :*/ "已关注",
          style: TextStyle(
            fontSize: 12,
            color: context.appTheme.primary,
          ),
        ),
      ),
    );
  }

  ///标题
  Widget _buildTitle() {
    return const Text(
      "标题最多两行标题最多两行标题最多两行标题最多两行",
      overflow: TextOverflow.ellipsis,
      strutStyle: StrutStyle(height: 1),
      maxLines: 2,
      style: TextStyle(fontSize: 16, color: Colors.white,height: 1),
    );
  }

  ///左侧图片
  Widget _buildLeftImage() {
    return AspectRatio(
      aspectRatio: 200 / 200,
      child: AppAsset.assets.imagesIconMineShare.toAssetImageWidget(
        fit: BoxFit.fill,
        radius: 5,
      ),
    );
  }
}
