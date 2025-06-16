import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';
import 'package:get/get.dart';

/// 金币充值记录
class CoinChargeRecordLogic extends  AppGetXBaseRefreshLogic{

  @override
  void onLoadData(bool firstLoad, int page, bool isLoadMore) {
    showSuccess();
  }

}