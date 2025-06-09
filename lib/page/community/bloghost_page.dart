import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_se/base/page/app_base_refresh_page.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/common/app_commom_search_head_widget.dart';
import 'package:flutter_se/page/common/mixin/tab_bar_mixin.dart';
import 'package:flutter_se/page/community/category/community_category_page.dart';
import 'package:flutter_se/page/community/community_detail_logic.dart';
import 'package:flutter_se/page/community/widget/article_link_widget.dart';
import 'package:flutter_se/page/community/widget/community_item_widget.dart';
import 'package:flutter_se/page/community/widget/html_hr_widget.dart';
import 'package:flutter_se/page/community/widget/html_image_built_widget.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/widget_utils.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../widget/ticker_provider.dart';
import 'bloghost_logic.dart';
import 'community_logic.dart';

///社区-博主
class BloghostPage extends AppGetXBaseRefreshPage<BloghostLogic> {
  BloghostPage({super.key});

  @override
  BloghostLogic createController() => BloghostLogic();

  @override
  String title() => "博主详情";

  @override
  bool isWidgetMode() => false;

  @override
  Widget? buildRefreshBody(BuildContext context) {
    return ListView.builder(
      itemCount: logic.itemList.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildHeadWidget();
        }
        return CommunityItemWidget(logic.itemList[index]);
      },
    );
  }

  ///头部
  Widget _buildHeadWidget() {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 12),
            AppAsset.assets.imagesIconMineShare.toAssetImageWidget(
              size: 60,
              radius: 30,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "名称最多八个字",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10,),
                  _buildHeadDescInfo(),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 35,),
        const Text("贴子",style: TextStyle(fontSize: 17,color: Colors.white),)
      ],
    );
  }

  ///头部描述信息区域
  Widget _buildHeadDescInfo() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          decoration: BoxDecoration(
            color: context.appTheme.primary,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Text(
            "至尊卡",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(width: 5,),
        const Text("1.5w",style: TextStyle(fontSize: 16,color: Colors.white),),
        Text(" 粉丝",style: TextStyle(fontSize: 14,color: context.appTheme.appGrey),),
      ],
    );
  }
}
