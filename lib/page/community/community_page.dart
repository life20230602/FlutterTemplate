import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/common/app_commom_search_head_widget.dart';
import 'package:flutter_se/page/community/category/community_category_page.dart';
import 'package:flutter_se/widget/widget_utils.dart';

import '../../widget/ticker_provider.dart';
import 'community_logic.dart';

///社区
class CommunityPage extends AppGetXBasePage<CommunityLogic>
    with SingleTickerProvider {
  CommunityPage({super.key});

  TabController? tabController;

  final List<Widget> bodyList = [];

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
            child: tabBarController(
              tabController: tabController!,
              tabs: _buildTab(),
              tabItems: _body(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _body() {
    if (bodyList.isNotEmpty) return bodyList;
    bodyList.add(CommunityCategoryPage());
    bodyList.add(CommunityCategoryPage());
    return bodyList;
  }

  List<Widget> _buildTab() {
    final widgets = <Widget>[];
    widgets.add(Tab(text: "分类 1"));
    widgets.add(Tab(text: "分类 2"));
    return widgets;
  }
}
