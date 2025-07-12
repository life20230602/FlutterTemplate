import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/common/fuli/fu_li_page.dart';
import 'package:flutter_se/page/mu_yin/mu_yin_logic.dart';
import 'package:flutter_se/page/mu_yin/widget/no_consume_permission_dialog.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/app_dialog_utils.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/widget_utils.dart';
import 'package:get/get.dart';

import '../../widget/ticker_provider.dart';
import 'category/mu_yin_category_page.dart';

///母淫
class MuYinPage extends AppGetXBasePage<MuYinLogic> with SingleTickerProvider {
  MuYinPage({super.key, required this.navigatorKey});

  TabController? tabController;

  final GlobalKey<NavigatorState> navigatorKey;

  final List<Widget> bodyList = [];

  final _index = 0.obs;

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  MuYinLogic createController() => MuYinLogic();

  @override
  List<Widget>? titleActions() {
    return [
      GestureDetector(
        onTap: () {
          Get.to(() => FuLiPage());
        },
        child: AppAsset.assets.imagesIconMuYinTitleMenu.toAssetImageWidget(
          width: 41,
          height: 36,
        ),
      ),
    ];
  }

  @override
  Widget buildChild(BuildContext context) {
    tabController = tabController ?? TabController(length: 2, vsync: this);
    return Column(
      children: [
        TabBar(
          padding: EdgeInsets.zero,
          dividerHeight: 0,
          labelStyle: TextStyle(
            fontSize: 16,
            fontFamily: context.textTheme.labelSmall?.fontFamily,
          ),
          tabs: _buildTab(),
          labelPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          indicatorColor: context.appTheme.primary,
          isScrollable: true,
          enableFeedback: false,
          tabAlignment: TabAlignment.center,
          controller: tabController,
          labelColor: context.appTheme.primary,
          unselectedLabelColor: Colors.white,
          onTap: (index) {
            _index.value = index;
            AppDialogUtils.showDialog(AWVConsumePermissionDialog());
          },
        ),
        Expanded(child: Obx(
              () => IndexedStack(
            sizing: StackFit.expand,
            index: _index.value,
            children: _body(),
          ),
        )),
      ],
    );
  }

  List<Widget> _body() {
    if (bodyList.isNotEmpty) return bodyList;
    bodyList.add(MuYinChildPage(type: 1, muYinNavigatorKey: navigatorKey));
    bodyList.add(MuYinChildPage(type: 2, muYinNavigatorKey: navigatorKey));
    return bodyList;
  }

  List<Widget> _buildTab() {
    final widgets = <Widget>[];
    widgets.add(const Tab(child: Text("千万特权", style: TextStyle(fontSize: 16))));
    widgets.add(const Tab(child: Text("暗网天堂", style: TextStyle(fontSize: 16))));
    return widgets;
  }
}
