import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';
import 'package:get/get.dart';

/// 金币充值
class CoinChargeLogic extends AppGetXBaseLogic{

  ///当前选中的金币
  final selectedItemObs = 0.obs;

  @override
  void onLoad() {
    showSuccess();
  }

}