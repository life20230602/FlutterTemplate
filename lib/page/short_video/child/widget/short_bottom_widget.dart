import 'package:flutter/material.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/utils/int_convert_utils.dart';
import 'package:get/get.dart';

import '../../../../bean/video_list_item_bean.dart';
import '../../../../config/user_manager_utils.dart';
import '../../../../res/app_asset.dart';

///短视频底部文字
class ShortBottomInfoWidget extends StatelessWidget {
  const ShortBottomInfoWidget(this.element, {super.key});

  final VideoListElement element;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "@${element.uploaderName}",
          style: const TextStyle(fontSize: 16),
        ),
        Container(
          width: context.mediaQuerySize.width,
          padding: const EdgeInsets.only(right: 60),
          child: Text(
            element.title,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        if (element.tags != null && element.tags!.isNotEmpty) _buildTags(element.tags!),
        const SizedBox(height: 10,),
        if (!UserManager.get().isVip()) _buildVipInfo(element),
      ],
    );
  }

  ///构建VIP状态信息
  Widget _buildVipInfo(VideoListElement element) {
    return GestureDetector(
      onTap: () {
        // RouteUtils.toVip();
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.red),
        padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
        margin: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            AppAsset.assets.imagesIconMineShare.toAssetImageWidget(width: 16, height: 14),
            Text(
              "免费预览10秒VIP解锁完整版${element.videoLength.toHms()}",
              style: const TextStyle(color: Colors.black, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  ///构建视频标签
  Widget _buildTags(List<VideoTag> tags) {
    // return VideoTagWidget(
    //   tags: tags,
    // );
    return Text("Tag");
  }
}
