import 'package:flutter_se/base/logic/app_exception_extension.dart';

import '../../../base/http/exception/app_server_exception.dart';
import '../../../base/logic/app_base_logic.dart';
import '../../../base/logic/app_base_network_logic.dart';
import '../../../bean/user_info_bean.dart';
import '../../../http/rest_api_manager.dart';
import '../../../config/user_manager_utils.dart';

///首页 tab 配置加载
mixin MainTabConfigLoadMixin on AppGetXBaseLogic
    implements AppBaseNetworkLogic {
  ///加载首页配置
  void loadMainTabConfig({bool loading = false}) {
    var userInfo = ApiManager().getRetryClient().getHomeTab(cancelToken, {});
    if (loading) {
      userInfo = bindLoading(userInfo);
    }
    userInfo
        .then((value) {
          //更新用户缓存数据
          onTabConfigLoadSuccess();
        })
        .catchException(
          this,
          showErrorPage: false,
          onAppException: (e) {
            return onTabConfigLoadError(e);
          },
        );
  }

  ///tab 加载成功
  void onTabConfigLoadSuccess();

  ///错误处理
  bool onTabConfigLoadError(AppServerException e) {
    return false;
  }
}
