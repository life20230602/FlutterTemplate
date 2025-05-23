import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_base_refresh_page.dart';
import 'package:flutter_se/page/common/video/video_item_logic_mixin.dart';
import 'package:flutter_se/page/common/video/video_item_mixin.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/app_divider_widget.dart';

import '../../../widget/ticker_provider.dart';
import 'video_category_logic.dart';
import 'widget/video_tag_list_widget.dart';

/// 视频列表分类
class VideoCategoryPage extends AppGetXBaseRefreshPage<VideoCategoryLogic>
    with SingleTickerProvider ,VideoItemMixin{
  VideoCategoryPage({super.key});

  TabController? _tabController;

  @override
  createController() => VideoCategoryLogic();

  @override
  bool isWidgetMode() => true;

  @override
  Widget? buildRefreshBody(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget? buildRefreshBodyScrollPhysics(
    BuildContext context,
    ScrollPhysics physics,
  ) {
    return CustomScrollView(
      physics: physics,
      scrollDirection: Axis.vertical,
      slivers: [
        SliverToBoxAdapter(child: _buildBanner()),
        SliverToBoxAdapter(child: _buildVideoTag()),
        SliverToBoxAdapter(child: _buildSortTitle()),
        buildSliverMasonryList(),
      ],
    );
  }

  ///banner
  Widget _buildBanner() {
    return AspectRatio(
      aspectRatio: 350 / 150,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Center(child: Text("banner")),
      ),
    );
  }

  ///视频标签
  Widget _buildVideoTag() {
    return VideoTagListWidget([
      "标标标标",
      "标签22",
      "标333签11",
      "标签122",
      "标签11",
      "2标签2",
    ]);
  }

  ///排序标题
  Widget _buildSortTitle() {
    return Container(
      color: context.appTheme.blackColor,
      margin: EdgeInsets.only(top: 10),
      height: 38,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TabBar(
              dividerHeight: 0,
              tabs: _buildSortTabs(),
              labelStyle: TextStyle(fontSize: 14, color: Colors.white),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const BoxDecoration(color: Colors.transparent),
              labelPadding: EdgeInsets.zero,
              isScrollable: false,
              enableFeedback: false,
              tabAlignment: TabAlignment.fill,
              controller:
              _tabController ??
                  (_tabController = TabController(length: 4, vsync: this)),
              labelColor: context.appTheme.primary,
              onTap: (index) {},
              unselectedLabelColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 18,
            width: 21,
            child: AppDividerWidget(
              verticalDivider: true,
            ),
          ),
          AppAsset.assets.imagesIconVideoListShowTypeList.toAssetImageWidget(size: 18),
          const SizedBox(width: 10,)
        ],
      ),
    );
  }

  ///排序 tab
  List<Widget> _buildSortTabs() {
    final widgets = [
      const Tab(text: "最近更新"),
      const Tab(text: "本周最热"),
      const Tab(text: "最多观看"),
      const Tab(text: "最多评论"),
    ];
    return widgets;
  }

  @override
  VideoItemLogicMixin getVideoListController() => logic;
}
