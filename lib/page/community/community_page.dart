import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/common/app_commom_search_head_widget.dart';
import 'package:flutter_se/page/common/mixin/tab_bar_mixin.dart';
import 'package:flutter_se/page/community/category/community_category_page.dart';
import 'package:flutter_se/widget/widget_utils.dart';

import '../../widget/ticker_provider.dart';
import 'community_logic.dart';

///社区
class CommunityPage extends AppGetXBasePage<CommunityLogic>
    with SingleTickerProvider,TabBarMixin {
  CommunityPage({super.key});

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  CommunityLogic createController() => CommunityLogic();

  @override
  Widget buildChild(BuildContext context) {
    tabController = tabController ?? TabController(length: 2, vsync: this);
    return SafeArea(
      child: Column(
        children: [
          AppCommonSearchHeadWidget(showBack: false),
          Expanded(
            child: buildTabBar(),
          ),
        ],
      ),
    );
  }

  @override
  List<Widget> buildBody() {
    return [
      CommunityCategoryPage(),
      CommunityCategoryPage(),
    ];
  }

  @override
  List<Widget> buildTab() {
    return [
      Tab(text: "分类 1"),
      Tab(text: "分类 2"),
    ];
  }
}
