import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/launcher/launcher_logic.dart';
import 'package:flutter_se/page/launcher/navigation_listener.dart';
import 'package:flutter_se/page/splash/splash_page.dart';
import 'package:flutter_se/res/style.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:get/get.dart';

import 'bean/navigation_item.dart';

///首页
class LauncherPage extends AppGetXBasePage<LauncherLogic>
    with NavigationController {
  LauncherPage({super.key});

  final _currentIndex = 0.obs;

  //导航栏上一次选中的位置
  var _preNavigationIndex = 0;

  @override
  Widget? buildBottomNavigationBar() {
    return Obx(() {
      var menuListObs = logic.menuListObs;
      if (menuListObs.isEmpty) {
        return const SizedBox.shrink();
      }
      if (kIsWeb || Platform.isAndroid) {
        return _buildBottomBarWidget();
      } else {
        return SizedBox(
          height: Get.mediaQuery.padding.bottom + 50,
          child: _buildBottomBarWidget(),
        );
      }
    });
  }

  @override
  Function()? onBackListener() {
    return () {
      //第一个模块有内嵌路由管理，不是统一的路由管理
      if(_currentIndex.value == 0){
        if (Navigator.canPop(logic.muYinNavigatorKey.currentContext!)) {
          Navigator.pop(logic.muYinNavigatorKey.currentContext!);
          return;
        }
      }
      SystemNavigator.pop();
    };
  }

  @override
  bool enableTopSafeArea() {
    return false;
  }

  Widget _buildBottomBarWidget() {
    return Theme(
      data: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          enableFeedback: false,
        ),
        brightness: Brightness.dark,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        // 导航栏
        items: _items(),
        backgroundColor: context.appTheme.appBottomBarBgColor,
        currentIndex: _currentIndex.value,
        // 选中的位置
        onTap: (index) {
          _currentIndex.value = index;
        },
        selectedItemColor: context.appTheme.primary,
        selectedFontSize: 13,
        selectedLabelStyle: TextStyle(
          fontFamily: context.textTheme.labelSmall?.fontFamily,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: context.textTheme.labelSmall?.fontFamily,
        ),
        unselectedFontSize: 13,
        unselectedItemColor: context.appTheme.appGrey,
        type: BottomNavigationBarType.fixed, // 这个要设置，不然默认颜色 出不来
      ),
    );
  }

  @override
  bool showTitle() {
    return false;
  }

  @override
  Widget buildChild(BuildContext context) {
    var list = logic.menuListObs.map((element) => element.body!).toList();
    return Obx(() => IndexedStack(index: _currentIndex.value, children: list));
  }

  /// 导航栏
  List<BottomNavigationBarItem> _items() {
    final items = <BottomNavigationBarItem>[];
    for (var element in logic.menuListObs) {
      items.add(
        BottomNavigationBarItem(
          icon: _buildIcon(element.defaultImage.toString(), null),
          activeIcon: _buildIcon(
            element.activeImage.toString(),
            element.activeColor,
          ),
          label: element.text,
        ),
      );
    }
    return items;
  }

  @override
  LauncherLogic createController() {
    return LauncherLogic();
  }

  Widget _buildIcon(String image, Color? color) {
    return Container(
      width: 35,
      height: 35,
      padding: const EdgeInsets.all(5),
      child: image.toAssetImageWidget(color: color),
    );
  }

  @override
  void changeIndex(int position) {
    _preNavigationIndex = _currentIndex.value;
    _currentIndex.value = position;
  }

  @override
  void toNext() {
    var value = _currentIndex.value;
    _currentIndex.value = (value + 1) % logic.menuListObs.length;
  }

  @override
  void toPrevious() {
    int pre = _currentIndex.value;
    _currentIndex.value = _preNavigationIndex;
    _preNavigationIndex = pre;
  }
}
