import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';

///官方群
class OfficialLogic extends AppGetXBaseRefreshLogic with AppRefreshHelper<String>{

  @override
  void onLoadData(bool firstLoad, int page, bool isLoadMore) {
    showSuccess();
  }

}