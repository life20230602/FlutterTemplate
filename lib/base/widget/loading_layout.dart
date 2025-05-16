import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 加载状态：加载中 成功 错误 空页面
enum LoadingState { loading, success, error, empty }

/// 成功的构建器
typedef ContentBuilder = Widget Function(BuildContext context);

/// 自定义加载控件
class LoadingLayout extends StatelessWidget {
  const LoadingLayout(
      {super.key,
      this.state = LoadingState.loading, // 默认加载中
      this.retry,
      required this.contentBuilder});

  final LoadingState state;
  final VoidCallback? retry; // 错误 空页面 点击回调
  final ContentBuilder contentBuilder; // 成功的页面 子类实现

  @override
  Widget build(BuildContext context) {
    if (state == LoadingState.loading) {
      return Center(
        child: loadingWidget(context),
      );
    } else if (state == LoadingState.error) {
      return emptyWidget(desc: "页面异常，点击重试", retry: retry);
    } else if (state == LoadingState.empty) {
      return emptyWidget(retry: retry);
    }
    return contentBuilder(context);
  }
}

extension LoadingExt on StatelessWidget {
  Widget emptyWidget(
      {String assetsIcon = "",
      String desc = "暂无数据",
      VoidCallback? retry}) {
    return GestureDetector(
      onTap: retry,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetsIcon,
              width: 80,
              height: 80,
            ),
            Text(
              desc,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  /// 加载中
  Widget loadingWidget(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 2,
      color: context.theme.primaryColor,
    );
  }
}
