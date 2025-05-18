import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mu_yin/mu_yin_logic.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/widget_utils.dart';

import '../../widget/ticker_provider.dart';
import 'category/mu_yin_category_page.dart';

///母淫
class MuYinPage extends AppGetXBasePage<MuYinLogic> with SingleTickerProvider {
  MuYinPage({super.key, required this.muYinNavigatorKey});

  TabController? tabController;

  final GlobalKey<NavigatorState> muYinNavigatorKey;

  final List<Widget> bodyList = [];

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  MuYinLogic createController() => MuYinLogic();

  @override
  List<Widget>? titleActions() {
    return [
      AppAsset.assets.imagesIconMuYinTitleMenu.toAssetImageWidget(
        width: 41,
        height: 36,
      ),
    ];
  }

  @override
  Widget buildChild(BuildContext context) {
    tabController = tabController ?? TabController(length: 2, vsync: this);
    return tabBarController(
      tabController: tabController!,
      tabs: _buildTab(),
      centerTitle: true,
      tabItems: _body(),
      titleActions: titleActions(),
    );
  }

  List<Widget> _body() {
    if (bodyList.isNotEmpty) return bodyList;
    bodyList.add(MuYinChildPage(type: 1, muYinNavigatorKey: muYinNavigatorKey));
    bodyList.add(MuYinChildPage(type: 2, muYinNavigatorKey: muYinNavigatorKey));
    return bodyList;
  }

  List<Widget> _buildTab() {
    final widgets = <Widget>[];
    widgets.add(Tab(child: Text("千万特权", style: TextStyle(fontSize: 16))));
    widgets.add(Tab(child: Text("会员特权", style: TextStyle(fontSize: 16))));
    return widgets;
  }
}
