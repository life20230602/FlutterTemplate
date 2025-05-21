import 'package:flutter/cupertino.dart';
import 'package:flutter_se/base/logic/app_base_logic.dart';

///输入兑换码
class InputExchangeCodeLogic extends AppGetXBaseLogic{
  final TextEditingController codeController = TextEditingController();
  @override
  void onLoad() {
    showSuccess();
  }
}
