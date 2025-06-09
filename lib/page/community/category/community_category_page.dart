import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';
import 'package:flutter_se/base/page/app_base_refresh_page.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/community/mixin/community_item_mixin.dart';
import 'package:flutter_se/page/community/tag/community_tag_page.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/widget/component/ad_common_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'community_category_logic.dart';

///社区分类列表
class CommunityCategoryPage
    extends AppGetXBaseRefreshPage<CommunityCategoryLogic>
    with CommunityItemMixin {
  CommunityCategoryPage({super.key});

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  CommunityCategoryLogic createController() => CommunityCategoryLogic();

  @override
  Widget? buildRefreshBody(BuildContext context) {
    return null;
  }

  ///构建刷新主体内容,自定义滑动主体
  @override
  Widget? buildRefreshBodyScrollPhysics(
    BuildContext context,
    ScrollPhysics physics,
  ) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: AdBannerWidget()),
        SliverToBoxAdapter(child: _buildTags()),
        buildSliverMasonryList()
      ],
    );
  }

  ///标签区域
  Widget _buildTags() {
    final tags = ["2", "1", "2", "1", "2", "1"];
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: AlignedGridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        itemCount: tags.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Get.to(CommunityTagPage(tagId: 0, tagName: tags[index]));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: context.appTheme.secondBgColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Text(
                    tags[0],
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                  ),
                  Text(
                    tags[0],
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  AppRefreshHelper getLogic() => logic;
}
