import 'package:flutter/cupertino.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';
import 'package:flutter_se/page/common/video/video_item_logic_mixin.dart';
import 'package:flutter_se/page/common/video/widget/app_video_item_widget.dart';
import 'package:flutter_se/bean/post_list_bean.dart';
import 'package:flutter_se/page/community/entity/post_list_element_ext.dart';
import 'package:flutter_se/page/short_video/child/short_video_player_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../bean/video_list_item_bean.dart';
import '../community_detail_page.dart';
import '../widget/community_item_widget.dart';

///通用的社区列表构建
mixin CommunityItemMixin on StatelessWidget {
  AppRefreshHelper getLogic();

  ///构建sliver模式的列表
  Widget buildSliverMasonryList() {
    return Obx(() {
      final length = getLogic().itemList.length;
      return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return _buildItem(index);
        }, childCount: length),
      );
    });
  }

  ///构建视频列表
  Widget buildList() {
    return Obx(
      () => ListView.builder(
        itemCount: getLogic().itemList.length,
        itemBuilder: (context, index) {
          return _buildItem(index);
        },
      ),
    );
  }

  ///创建item
  Widget _buildItem(int index) {
    final PostListElementExt item = getLogic().itemList[index];
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        Get.to(CommunityDetailPage());
      },
      child: CommunityItemWidget(item),
    );
  }
}
