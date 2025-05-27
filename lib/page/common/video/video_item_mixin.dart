import 'package:flutter/cupertino.dart';
import 'package:flutter_se/page/common/video/video_item_logic_mixin.dart';
import 'package:flutter_se/page/common/video/widget/app_video_item_widget.dart';
import 'package:flutter_se/page/short_video/child/short_video_player_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../bean/video_list_item_bean.dart';

///通用的视频列表构建
mixin VideoItemMixin on StatelessWidget {
  VideoItemLogicMixin getVideoListController();

  ///构建sliver模式的列表
  Widget buildSliverMasonryList({bool shortVideo = false}) {
    return Obx(() {
      var length = getVideoListController().itemList.length;
      return SliverMasonryGrid.count(
        childCount: length,
        crossAxisSpacing: 10,
        crossAxisCount: getVideoListController().showTypeObs.value == 0 ? 2 : 1,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(index, shortVideo: shortVideo);
        },
      );
    });
  }

  ///构建视频列表
  Widget buildVideoList({bool shortVideo = false}) {
    return Obx(
      () => AlignedGridView.count(
        itemCount: getVideoListController().itemList.length,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) {
          return _buildItem(index, shortVideo: shortVideo);
        },
      ),
    );
  }

  ///创建item
  Widget _buildItem(int index, {bool shortVideo = false}) {
    final VideoListElement item =
        getVideoListController().itemList[index];
    return AppVideoItemWidget(
      item,
      aspectRatio: shortVideo ? 173 / 236 : null,
      onVideoItemClick: (item) {
        if (shortVideo) {
          //短视频
          Get.to(ShortVideoPlayerPage(
            tempList: getVideoListController().itemList,
            index: index,
          ));
        } else {
          Get.toNamed("/video/detail?vid=${item.id}");
        }
      },
    );
  }
}
