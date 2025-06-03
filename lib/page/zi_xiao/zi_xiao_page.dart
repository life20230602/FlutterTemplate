import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/zi_xiao/vip/zx_vip_page.dart';
import 'package:flutter_se/page/zi_xiao/zi_xiao_child_page.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/app_divider_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'item_widget.dart';
import 'zi_xiao_logic.dart';

///子笑
class ZiXiaoPage extends AppGetXBasePage<ZiXiaoLogic> {
  ZiXiaoPage({super.key, required this.navigationKey});

  final GlobalKey<NavigatorState> navigationKey;

  @override
  ZiXiaoLogic createController() => ZiXiaoLogic();

  @override
  bool showBack() => false;

  @override
  bool showTitle() => false;

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 10),
          AspectRatio(
            aspectRatio: 629 / 370,
            child:
                AppAsset.assets.imagesIconZixiaoCoverTop.toAssetImageWidget(),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: AppDividerWidget(color: context.appTheme.primary),
          ),
          const SizedBox(height: 9),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: AppDividerWidget(color: context.appTheme.primary),
          ),
          const SizedBox(height: 12),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return AlignedGridView.count(
      itemCount: logic.itemEntityListObs.length,
      crossAxisCount: 3,
      mainAxisSpacing: 26,
      crossAxisSpacing: 8,
      itemBuilder: (context, index) {
        return ItemWidget(
          entity: logic.itemEntityListObs[index],
          onTap: () {
            if(!logic.itemEntityListObs[index].permission){
              Get.to(ZxVipPage());
              return;
            }
            //内部跳转，手动管理路由
            navigationKey.currentState!.push(
              GetPageRoute(
                transition: Transition.rightToLeft,
                popGesture: true,
                page:
                    () =>
                        ZiXiaoChildPage(), // Placeholder, BottomPage can be added here
              ),
            );
          },
        );
      },
    );
  }
}
