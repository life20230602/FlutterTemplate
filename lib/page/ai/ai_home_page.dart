import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/ai/ai_home_logic.dart';
import 'package:flutter_se/page/ai/diy_face_swap/diy_face_swap_page.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:get/get.dart';

class AiHomePage extends AppGetXBasePage<AiHomeLogic> {
  AiHomePage({super.key});

  @override
  AiHomeLogic createController() => AiHomeLogic();

  @override
  bool showTitle() => false;

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
        currentIndex: logic.currentIndexObs.value,
        // 选中的位置
        onTap: (index) {
          logic.currentIndexObs.value = index;
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

  Widget _buildIcon(String image, Color? color) {
    return Container(
      width: 35,
      height: 35,
      padding: const EdgeInsets.all(5),
      child: image.toAssetImageWidget(color: color),
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    var list = logic.menuListObs.map((element) => element.body!).toList();
    return Stack(
      fit: StackFit.expand,
      children: [
        Obx(
          () =>
              IndexedStack(index: logic.currentIndexObs.value, children: list),
        ),
        _buildDiyFaceSwapWidget(),
      ],
    );
  }

  Widget _buildDiyFaceSwapWidget() {
    return Positioned(
      width: 50,
      height: 50,
      right: 12,
      bottom: 30,
      child: GestureDetector(
        onTap: () {
          Get.to(DiyFaceSwapPage());
        },
        child: AppAsset.assets.imagesIconAiDiyFaceSwap.toAssetImageWidget(),
      ),
    );
  }
}
