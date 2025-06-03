import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_se/page/common/video/widget/app_video_item_widget.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/utils/int_convert_utils.dart';

import '../../../../bean/video_list_item_bean.dart';

///视频详情推荐视频的样式
class RecommendVideoItemWidget extends StatelessWidget {
  const RecommendVideoItemWidget(this.item, {super.key, this.onVideoItemClick});

  final VideoListElement item;
  final OnVideoItemClick? onVideoItemClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onVideoItemClick != null) {
          onVideoItemClick!(item);
        }
      },
      child: AspectRatio(
        aspectRatio: 355 / 110,
        child: Container(
          decoration: BoxDecoration(color: context.appTheme.secondBgColor, borderRadius: BorderRadius.circular(5)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildImage(item)),
              const SizedBox(
                width: 8,
              ),
              Expanded(child: _buildRightDesc(item)),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///创建封面
  Widget _buildImage(VideoListElement item) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
          child: item.horizontalCover.toEncryptNetworkImageWidget(),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: item.toPermissionWidget(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomRight: Radius.circular(6))),
        )
      ],
    );
  }

  Widget _buildRightDesc(VideoListElement item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        _buildTitle(item),
        const SizedBox(
          height: 5,
        ),
        // Expanded(
        //     child: VideoTagWidget(
        //   tags: item.tags ?? [],
        //   maxLines: 1,
        // )),
        const SizedBox(
          height: 10,
        ),
        _buildDescInfo(),
        const SizedBox(
          height: 3,
        ),
      ],
    );
  }

  ///视频标题
  Widget _buildTitle(VideoListElement item) {
    return Text(
      item.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 14),
    );
  }

  ///视频描述信息
  Widget _buildDescInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Text(
            "${item.clickCount.toUnit()}播放",
            style: const TextStyle(fontSize: 10),
          ),
        ),
        Text(
          item.videoLength.toHms(),
          style: const TextStyle(fontSize: 10),
        )
      ],
    );
  }
}
