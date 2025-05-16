import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';

import 'app_getx_base_page.dart';

///基础刷新父类
abstract class AppGetXBaseRefreshPage<T extends AppGetXBaseRefreshLogic>
    extends AppGetXBasePage<T> {
  AppGetXBaseRefreshPage({super.key});

  @override
  bool showTitle() {
    return !isWidgetMode();
  }

  ///是否启用下拉刷新
  bool enableRefresh() {
    return true;
  }

  ///是否启用加载更多
  bool enableLoadMore() {
    return true;
  }

  ///刷新默认是widget模式，因为根据经验来说一个页面不单单只有一个列表
  @override
  bool isWidgetMode() {
    return true;
  }

  @override
  Widget buildChild(BuildContext context) {
    return EasyRefresh.builder(
        controller: logic.refreshController,
        footer: buildRefreshFooter(),
        header: buildRefreshHeader(context),
        onRefresh: enableRefresh() ? logic.refreshCallback : null,
        onLoad: enableLoadMore() ? logic.loadMoreCallback : null,
        childBuilder: (BuildContext context, ScrollPhysics physics) {
          final child = buildRefreshBodyScrollPhysics(context, physics);
          if (child != null) {
            return child;
          }
          return ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(physics: physics),
              child: buildRefreshBody(context)!);
        });
  }

  Footer? buildRefreshFooter() {
    return null;
  }

  Header? buildRefreshHeader(BuildContext context) {
    return null;
  }

  ///构建刷新主体内容
  Widget? buildRefreshBody(BuildContext context);

  ///构建刷新主体内容,自定义滑动主体
  Widget? buildRefreshBodyScrollPhysics(
      BuildContext context, ScrollPhysics physics) {
    return null;
  }
}
