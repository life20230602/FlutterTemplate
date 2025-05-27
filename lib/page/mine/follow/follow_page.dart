import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';

import '../../../widget/ticker_provider.dart';
import '../../common/mixin/tab_bar_mixin.dart';
import 'follow_logic.dart';
import 'follow_module_page.dart';
import 'follow_user_page.dart';

/// 我的关注
class FollowPage extends AppGetXBasePage<FollowLogic>
    with TabBarMixin, SingleTickerProvider {
  FollowPage({super.key});

  @override
  FollowLogic createController() => FollowLogic();

  @override
  String title() => "我的关注";

  @override
  Widget buildChild(BuildContext context) {
    return buildTabBar(underlineWidth: 10);
  }

  @override
  List<Widget> buildBody() {
    return [FollowUserPage(), FollowModulePage()];
  }

  @override
  List<Widget> buildTab() {
    return [Text("用户"), Text("模块")];
  }
}
