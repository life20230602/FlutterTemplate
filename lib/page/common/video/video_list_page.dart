import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/component/app_back_button_widget.dart';
import 'package:flutter_se/widget/component/search_widget.dart';
import 'package:flutter_se/widget/widget_utils.dart';

import '../../../widget/ticker_provider.dart';
import '../app_commom_search_head_widget.dart';
import 'video_category_page.dart';
import 'video_list_logic.dart';

///视频列表
class VideoListPage extends AppGetXBasePage<VideoListLogic>
    with SingleTickerProvider {
  VideoListPage({super.key});

  TabController? tabController;

  final List<Widget> bodyList = [];

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  VideoListLogic createController() => VideoListLogic();

  @override
  Widget buildChild(BuildContext context) {
    tabController = tabController ?? TabController(length: 2, vsync: this);
    return SafeArea(
      child: Column(
        children: [
          AppCommonSearchHeadWidget(showBack: showBack(),),
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
    bodyList.add(VideoCategoryPage());
    bodyList.add(VideoCategoryPage());
    return bodyList;
  }

  List<Widget> _buildTab() {
    final widgets = <Widget>[];
    widgets.add(Tab(text: "分类 1"));
    widgets.add(Tab(text: "分类 2"));
    return widgets;
  }
}
