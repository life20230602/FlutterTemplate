import 'package:flutter/material.dart';
import 'package:flutter_se/res/style.dart';
import 'package:get/get.dart';

import 'custom_underline_tab_Indicator.dart';

class WidgetUtils {
  ///统一的tabbar创建
  static Widget tabBarController(
    TabController tabController,
    List<Widget> tabs,
    List<Widget> tabItems,
    List<Widget>? titleActions,
    bool centerTitle,
  ) {
    return DefaultTabController(
      length: tabController.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 40,
          primary: true,
          backgroundColor: Colors.black,
          centerTitle: centerTitle,
          title: LayoutBuilder(
            builder: (context, c) {
              return TabBar(
                dividerHeight: 0,
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: context.textTheme.labelSmall?.fontFamily,
                ),
                tabs: tabs,
                labelPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                indicatorColor: context.appTheme.primary,
                isScrollable: true,
                enableFeedback: false,
                tabAlignment: TabAlignment.center,
                controller: tabController,
                labelColor: context.appTheme.primary,
                unselectedLabelColor: Colors.white,
                indicator: CustomUnderlineTabIndicator(
                  isRound: true,
                  indicatorWidth: 19,
                  borderSide: BorderSide(
                    width: 3,
                    color: context.appTheme.primary,
                  ),
                ),
              );
            },
          ),
          leading: const SizedBox.shrink(),
          leadingWidth: 0,
          titleSpacing: 0,
          actionsPadding: EdgeInsets.zero,
          actions: titleActions,
        ),
        body: TabBarView(controller: tabController, children: tabItems),
      ),
    );
  }
}

extension WidgetExt on StatelessWidget {
  Widget tabBarController({
    required TabController tabController,
    required List<Widget> tabs,
    required List<Widget> tabItems,
    bool centerTitle = false,
    List<Widget>? titleActions,
  }) {
    return WidgetUtils.tabBarController(
      tabController,
      tabs,
      tabItems,
      titleActions,
      centerTitle
    );
  }
}
