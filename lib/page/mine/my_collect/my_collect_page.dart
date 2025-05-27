import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_base_page.dart';

import '../../../widget/ticker_provider.dart';
import '../../common/mixin/tab_bar_mixin.dart';
import 'my_collect_post_page.dart';
import 'my_collect_video_page.dart';

/// 我的收藏
class MyCollectPage extends AppBasePage
    with TabBarMixin, SingleTickerProvider {
  MyCollectPage({super.key});

  @override
  String title() => "我的收藏";

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
