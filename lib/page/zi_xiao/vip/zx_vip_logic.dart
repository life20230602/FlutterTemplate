import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';
import 'package:get/get.dart';

/// 子笑的 vip 界面
class ZxVipLogic extends AppGetXBaseLogic{

  ///当前选中的卡片
  final vipCheckedIndexObs = 0.obs;

  @override
  void onLoad() {
    showSuccess();
  }

}