import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_base_page.dart';
import 'package:flutter_se/page/short_video/child/short_video_player_page.dart';

import '../../../bean/video_list_item_bean.dart';

///短视频独立的页面
class ShortVideoDetailPage extends AppBasePage {
  ShortVideoDetailPage({super.key, this.tempList, this.index = 0});

  final List<VideoListElement>? tempList;
  final int index;

  @override
  bool isWidgetMode() {
    return true;
  }

  @override
  Widget buildChild(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          top: false,
          bottom: true,
          child: ShortVideoPlayerPage(tempList: tempList, index: index),
        ),
        Positioned(
          top: 0,
          height: kToolbarHeight,
          left: 0,
          right: 0,
          child: buildAppBar(context)!,
        ),
      ],
    );
  }

  @override
  double? titleHeight() {
    return kToolbarHeight;
  }

  @override
  Color? titleBackgroundColor() {
    return Colors.transparent;
  }
}
