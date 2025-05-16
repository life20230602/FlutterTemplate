import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:get/get.dart';

enum RefreshState { refresh, loadMore, none }

///app 通用支持刷新的页面控制器
abstract class AppGetXBaseRefreshLogic extends AppGetXBaseLogic {
  int _page = 1;

  //刷新状态
  RefreshState _refreshState = RefreshState.none;

  ///刷新计数，用于观察刷新次数
  final refreshCount = 0.obs;

  ///获取当前页码
  int getPage() => _page;

  EasyRefreshController refreshController = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  @override
  void onLoad() {
    onLoadData(true, _page, false);
  }

  ///启动刷新
  void startRefresh({bool firstLoad = true}) {
    _page = 1;
    _refreshState = RefreshState.refresh;
    onLoadData(firstLoad, _page, false);
  }

  ///启动加载更多
  void startLoadMore() {
    _page++;
    _refreshState = RefreshState.loadMore;
    onLoadData(false, _page, true);
  }

  ///刷新控件回调
  refreshCallback() async {
    startRefresh(firstLoad: false);
  }

  ///加载更多回调
  loadMoreCallback() async {
    startLoadMore();
  }

  ///加载数据
  void onLoadData(bool firstLoad, int page, bool isLoadMore);

  ///设置刷新成功
  void _setRefreshSuccess() {
    if (_refreshState != RefreshState.refresh) {
      return;
    }
    _refreshState = RefreshState.none;
    refreshCount.value = refreshCount.value + 1;
    refreshController.finishRefresh(IndicatorResult.success);
  }

  ///设置加载成功
  void _setLoadMoreSuccess(bool noMore) {
    if (_refreshState != RefreshState.loadMore) {
      return;
    }
    _refreshState = RefreshState.none;
    if (noMore) {
      refreshController.finishLoad(IndicatorResult.noMore);
    } else {
      refreshController.finishLoad(IndicatorResult.success);
    }
  }

  ///通知界面刷新或者加载更多完成
  void complete(bool noMore) {
    if (_refreshState == RefreshState.refresh) {
      _setRefreshSuccess();
    } else if (_refreshState == RefreshState.loadMore) {
      _setLoadMoreSuccess(noMore);
    }
  }
}
