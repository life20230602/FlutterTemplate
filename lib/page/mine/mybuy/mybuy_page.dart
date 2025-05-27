import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_base_page.dart';

import '../../../widget/ticker_provider.dart';
import '../../common/mixin/tab_bar_mixin.dart';
import 'my_buy_post_page.dart';
import 'my_buy_video_page.dart';

/// 我的购买
class MyBuyPage extends AppBasePage
    with TabBarMixin, SingleTickerProvider {
  MyBuyPage({super.key});

  @override
  String title() => "我的购买";

  @override
  Widget buildChild(BuildContext context) {
    return buildTabBar(underlineWidth: 10);
  }

  @override
  List<Widget> buildBody() {
    return [MyBuyVideoPage(), MyBuyPostPage()];
  }

  @override
  List<Widget> buildTab() {
    return [Text("视频"), Text("帖子")];
  }
}
