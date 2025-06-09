import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/common/app_commom_search_head_widget.dart';
import 'package:flutter_se/page/common/mixin/tab_bar_mixin.dart';
import 'package:flutter_se/page/community/category/community_category_page.dart';
import 'package:flutter_se/page/community/community_detail_logic.dart';
import 'package:flutter_se/page/community/tag/community_tag_logic.dart';
import 'package:flutter_se/page/community/widget/article_link_widget.dart';
import 'package:flutter_se/page/community/tag/widget/community_tag_head_widget.dart';
import 'package:flutter_se/page/community/widget/html_hr_widget.dart';
import 'package:flutter_se/page/community/widget/html_image_built_widget.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/widget_utils.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../widget/ticker_provider.dart';
import '../community_logic.dart';
import 'community_tag_child_page.dart';

///社区-标签
class CommunityTagPage extends AppGetXBasePage<CommunityTagLogic>
    with TabBarMixin, SingleTickerProvider {
  CommunityTagPage({super.key, required this.tagId, required this.tagName});

  final String tagName;
  final int tagId;

  @override
  CommunityTagLogic createController() => CommunityTagLogic();

  @override
  String title() => tagName;

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [CommunityTagHeadWidget(), Expanded(child: buildTabBar())],
      ),
    );
  }

  @override
  List<Widget> buildBody() {
    return [
      CommunityTagChildPage(tagId: tagId),
      CommunityTagChildPage(tagId: tagId),
    ];
  }

  @override
  List<Widget> buildTab() {
    return const [
      Text("data", style: TextStyle(fontSize: 16, color: Colors.white)),
      Text("data", style: TextStyle(fontSize: 16, color: Colors.white)),
    ];
  }
}
