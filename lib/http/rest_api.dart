import 'package:dio/dio.dart';
import 'package:flutter_se/base/http/base_dio.dart';
import 'package:flutter_se/bean/main_tab_config_bean.dart';
import 'package:retrofit/retrofit.dart';

import '../bean/user_info_bean.dart';

part 'rest_api.g.dart';

/// 如果在此文件修改，需要通过命令生成 dart pub run build_runner build
@RestApi()
abstract class RestClient {
  factory RestClient({Dio? dio, String? baseUrl}) {
    dio ??= BaseDio.getInstance().getDefaultDio();
    return _RestClient(dio, baseUrl: baseUrl);
  }

  ///获取用户信息
  @POST('/api/v1/users/')
  Future<UserInfoBean> getUserInfo(
    @CancelRequest() CancelToken cancelToken,
    @Body() Map<String, dynamic> map,
  );

  ///首页 tab
  @POST('/api/v1/category')
  Future<MainTabConfigBean> getHomeTab(
    @CancelRequest() CancelToken cancelToken,
    @Body() Map<String, dynamic> map,
  );
}
