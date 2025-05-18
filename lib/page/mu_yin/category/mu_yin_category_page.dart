import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mine/mine_page.dart';
import 'package:flutter_se/page/mu_yin/detail/mu_yin_category_detail_page.dart';
import 'package:flutter_se/page/mu_yin/mu_yin_logic.dart';
import 'package:flutter_se/widget/widget_utils.dart';
import 'package:get/get.dart';

import 'mu_yin_category_logic.dart';

///母淫-列表页
class MuYinChildPage extends AppGetXBasePage<MuYinChildLogic> {
  MuYinChildPage({
    super.key,
    required this.type,
    required this.muYinNavigatorKey,
  });

  ///1  千万视频  2 会员特权
  final int type;

  ///导航路由 key
  final GlobalKey<NavigatorState> muYinNavigatorKey;

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  MuYinChildLogic createController() => MuYinChildLogic();

  @override
  Widget buildChild(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //内部跳转，手动管理路由
        muYinNavigatorKey.currentState!.push(
          GetPageRoute(
            transition: Transition.rightToLeft,
            popGesture: true,
            page:
                () =>
                    MuYinCategoryDetailPage(), // Placeholder, BottomPage can be added here
          ),
        );
      },
      child: Text("data"),
    );
  }
}
