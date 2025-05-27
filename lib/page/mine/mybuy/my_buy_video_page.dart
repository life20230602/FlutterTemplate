import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_base_refresh_page.dart';
import 'package:flutter_se/page/common/video/video_item_logic_mixin.dart';
import 'package:flutter_se/page/common/video/video_item_mixin.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';

import 'my_buy_video_logic.dart';
import 'my_buy_post_logic.dart';

/// 我的购买-视频
class MyBuyVideoPage extends AppGetXBaseRefreshPage<MyBuyVideoLogic>
    with VideoItemMixin {
  MyBuyVideoPage({super.key});

  @override
  MyBuyVideoLogic createController() => MyBuyVideoLogic();

  @override
  Widget? buildRefreshBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 20, 12, 0),
      child: buildVideoList(),
    );
  }

  @override
  VideoItemLogicMixin getVideoListController() => logic;
}
