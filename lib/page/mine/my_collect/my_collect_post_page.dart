import 'package:flutter/material.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';
import 'package:flutter_se/base/page/app_base_refresh_page.dart';
import 'package:flutter_se/page/community/mixin/community_item_mixin.dart';

import 'my_collect_post_logic.dart';

/// 我的收藏-帖子
class MyBuyPostPage extends AppGetXBaseRefreshPage<MyBuyPostLogic>
    with CommunityItemMixin {
  MyBuyPostPage({super.key});

  @override
  MyBuyPostLogic createController() => MyBuyPostLogic();

  @override
  Widget? buildRefreshBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 20, 12, 0),
      child: buildList(),
    );
  }

  @override
  AppRefreshHelper getLogic() => logic;
}
