import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/page/community/community_page.dart';
import 'package:flutter_se/page/mine/mine_page.dart';
import 'package:flutter_se/page/mu_yin/mu_yin_page.dart';
import 'package:flutter_se/page/short_video/short_video_page.dart';
import 'package:flutter_se/page/zi_xiao/zi_xiao_page.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/app_dialog_utils.dart';
import 'package:get/get.dart';

import '../../res/app_asset.dart';
import 'bean/navigation_item.dart';

///首页
class LauncherLogic extends AppGetXBaseLogic {
  final menuListObs = <NavigationItem>[].obs;

  //为了实现母淫菜单页面内部跳转，单独管理路由
  final GlobalKey<NavigatorState> muYinNavigatorKey = GlobalKey();

  //子笑模块页面内部跳转
  final GlobalKey<NavigatorState> ziXiaoNavigatorKey = GlobalKey();

  @override
  void onLoad() {
    startup();
  }

  //开始启动加载底部菜单数据
  void startup() {
    if (menuListObs.isNotEmpty) {
      return;
    }
    menuListObs.add(
      NavigationItem(
        "母淫",
        defaultImage: AppAsset.assets.imagesMainBottomIcon1Default,
        activeImage: AppAsset.assets.imagesMainBottomIcon1Active,
        body: Navigator(
          key: muYinNavigatorKey,
          onGenerateRoute: (settings) {
            return GetPageRoute(
              transition: Transition.rightToLeft,
              popGesture: true,
              settings: settings,
              page:
                  () => MuYinPage(
                    navigatorKey: muYinNavigatorKey,
                  ), // Placeholder, BottomPage can be added here
            );
          },
        ),
      ),
    );
    menuListObs.add(
      NavigationItem(
        "子笑",
        defaultImage: AppAsset.assets.imagesMainBottomIcon2Default,
        activeImage: AppAsset.assets.imagesMainBottomIcon2Active,
        body: Navigator(
          key: ziXiaoNavigatorKey,
          onGenerateRoute: (settings) {
            return GetPageRoute(
              transition: Transition.rightToLeft,
              popGesture: true,
              settings: settings,
              page:
                  () => ZiXiaoPage(
                    navigationKey: ziXiaoNavigatorKey,
                  ), // Placeholder, BottomPage can be added here
            );
          },
        ),
      ),
    );
    menuListObs.add(
      NavigationItem(
        "短视频",
        defaultImage: AppAsset.assets.imagesMainBottomIcon3Default,
        activeImage: AppAsset.assets.imagesMainBottomIcon3Active,
        body: ShortVideoPage(),
      ),
    );
    menuListObs.add(
      NavigationItem(
        "社区",
        defaultImage: AppAsset.assets.imagesMainBottomIcon4Default,
        activeImage: AppAsset.assets.imagesMainBottomIcon4Active,
        body: CommunityPage(),
      ),
    );
    menuListObs.add(
      NavigationItem(
        "我的",
        defaultImage: AppAsset.assets.imagesMainBottomIcon5Default,
        activeImage: AppAsset.assets.imagesMainBottomIcon5Active,
        body: MinePage(),
      ),
    );
    showSuccess();
  }
}
