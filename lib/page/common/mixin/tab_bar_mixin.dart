import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/widget/widget_utils.dart';

import '../../../widget/ticker_provider.dart';

mixin TabBarMixin implements SingleTickerProvider {
  TabController? tabController;

  final List<Widget> bodyList = [];

  Widget buildTabBar({List<Widget>? titleActions,double? underlineWidth}) {
    tabController = tabController ?? TabController(length: 2, vsync: this);
    return WidgetUtils.tabBarController(
      tabController!,
      buildTab(),
      _body(),
      titleActions,
      false,
      underlineWidth: underlineWidth
    );
  }

  List<Widget> _body() {
    if (bodyList.isNotEmpty) return bodyList;
    bodyList.addAll(buildBody());
    return bodyList;
  }

  ///tabbar 标题
  List<Widget> buildTab();

  ///tabbar 内容
  List<Widget> buildBody();
}
