import 'package:flutter/cupertino.dart';
import 'package:flutter_se/base/page/app_base_refresh_page.dart';
import 'package:flutter_se/page/common/video/video_item_logic_mixin.dart';
import 'package:flutter_se/page/common/video/video_item_mixin.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'short_video_logic.dart';

///短视频
class ShortVideoPage extends AppGetXBaseRefreshPage<ShortVideoLogic>
    with VideoItemMixin {
  ShortVideoPage({super.key});

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  ShortVideoLogic createController() => ShortVideoLogic();

  @override
  VideoItemLogicMixin getVideoListController() => logic;

  @override
  Widget? buildRefreshBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: buildVideoList(shortVideo: true),
    );
  }
}
