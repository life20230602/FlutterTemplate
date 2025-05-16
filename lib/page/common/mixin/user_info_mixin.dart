import 'package:flutter_se/base/logic/app_exception_extension.dart';

import '../../../base/http/exception/app_server_exception.dart';
import '../../../base/logic/app_base_logic.dart';
import '../../../base/logic/app_base_network_logic.dart';
import '../../../bean/user_info_bean.dart';
import '../../../http/rest_api_manager.dart';
import '../../../config/user_manager_utils.dart';

///通用请求用户信息
mixin UserInfoMixin on AppGetXBaseLogic implements AppBaseNetworkLogic {
  ///刷新用户信息
  void refreshUserInfo({bool loading = false}) {
    // var userInfo = ApiManager().getRetryClient().getUserInfo(cancelToken);
    // if (loading) {
    //   userInfo = bindLoading(userInfo);
    // }
    // userInfo.then((value) {
    //   //更新用户缓存数据
    //   UserManager.get().login(value);
    //   onUserInfoRefreshSuccess(value);
    // }).catchException(this, showErrorPage: false, onAppException: (e) {
    //   return onUserInfoError(e);
    // });
  }

  ///用户信息刷新成功
  void onUserInfoRefreshSuccess(UserInfoBean bean);

  ///错误处理
  bool onUserInfoError(AppServerException e) {
    return false;
  }
}
