import 'package:flutter/cupertino.dart';
import 'package:flutter_se/page/common/video/video_item_logic_mixin.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../bean/video_list_item_bean.dart';
import '../../../widget/app_video_item_widget.dart';

///通用的视频列表构建
mixin VideoItemMixin on StatelessWidget {
  VideoItemLogicMixin getVideoListController();

  ///构建sliver模式的列表
  Widget buildSliverMasonryList({bool shortVideo = false}) {
    return Obx(() {
      var length = getVideoListController().getVideoList().length;
      return SliverMasonryGrid.count(
        childCount: length == 0 ? 1 : length,
        crossAxisSpacing: 10,
        crossAxisCount: length == 0 ? 1 : 2,
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
        itemCount: getVideoListController().getVideoList().length,
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
        getVideoListController().getVideoList()[index];
    return AppVideoItemWidget(
      item,
      aspectRatio: shortVideo ? 173 / 236 : null,
      onVideoItemClick: (item) {
        if (shortVideo) {
          //短视频
          // Get.to(ShortVideoDetailPage(
          //   tempList: getVideoListController().getVideoList().map((e)=>(e as VideoListElement)).toList(),
          //   index: index,
          // ));
        } else {
          Get.toNamed("/video/detail?vid=${item.id}");
        }
      },
    );
  }
}
