import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:get/get.dart';

///ai vip
class AiVipLogic extends AppGetXBaseLogic {
  //vip 卡片选中
  final vipCardSelectedIndexObs = 0.obs;

  @override
  void onLoad() {
    showSuccess();
  }
}
