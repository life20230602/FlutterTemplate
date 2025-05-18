import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mu_yin/detail/mu_yin_type_page.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/component/app_back_button_widget.dart';
import 'package:flutter_se/widget/component/search_widget.dart';
import 'package:flutter_se/widget/widget_utils.dart';

import '../../../widget/ticker_provider.dart';
import 'mu_yin_category_detail_logic.dart';
import 'mu_yin_type_logic.dart';

///母淫-分类-详情
class MuYinCategoryDetailPage extends AppGetXBasePage<MuYinCategoryDetailLogic>
    with SingleTickerProvider {
  MuYinCategoryDetailPage({super.key});

  TabController? tabController;

  final List<Widget> bodyList = [];

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  MuYinCategoryDetailLogic createController() => MuYinCategoryDetailLogic();

  @override
  Widget buildChild(BuildContext context) {
    tabController = tabController ?? TabController(length: 2, vsync: this);
    return SafeArea(
      child: Column(
        children: [
          _buildTop(),
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
    bodyList.add(MuYinTypePage());
    bodyList.add(MuYinTypePage());
    return bodyList;
  }

  List<Widget> _buildTab() {
    final widgets = <Widget>[];
    widgets.add(Tab(text: "分类 1"));
    widgets.add(Tab(text: "分类 2"));
    return widgets;
  }

  Widget _buildTop() {
    return Row(
      children: [
        AppBackButton(),
        Expanded(child: SearchWidget()),
        const SizedBox(width: 10),
        AppAsset.assets.imagesIconMuYinTitleMenu.toAssetImageWidget(
          width: 41,
          height: 36,
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
