import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:get/get.dart';

///扫码二维码
class ScanQrcodeLogic extends AppGetXBaseLogic {
  final ScanKitController scanKitController = ScanKitController();

  @override
  void onLoad() {
    scanKitController.onResult.listen((result) {
      Get.back(result: result.originalValue);
    });
  }

  @override
  void onClose() {
    super.onClose();
    scanKitController.dispose();
  }
}
