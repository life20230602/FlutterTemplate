import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_base_refresh_page.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'short_video_logic.dart';

///短视频
class ShortVideoPage extends AppGetXBaseRefreshPage<ShortVideoLogic> {
  ShortVideoPage({super.key});

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  ShortVideoLogic createController() => ShortVideoLogic();

  @override
  Widget? buildRefreshBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: Obx(
        () => AlignedGridView.count(
          itemCount: logic.itemList.length,
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          itemBuilder: (context, index) {
            return _buildItem(context, index);
          },
        ),
      ),
    );
  }

  ///构建 item
  Widget _buildItem(BuildContext context, int index) {
    return AspectRatio(
      aspectRatio: 362 / 486,
      child: Container(
        alignment: Alignment.center,
        color: context.appTheme.secondBgColor,
        child: Text("data"),
      ),
    );
  }
}
