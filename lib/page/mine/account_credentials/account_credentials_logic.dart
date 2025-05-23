import 'dart:typed_data';

import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:widgets_to_image_plus/widgets_to_image_plus.dart';

import '../../../utils/app_dialog_utils.dart';

/// 账号凭证
class AccountCredentialsLogic extends AppGetXBaseLogic {
  final WidgetToImagePlus widgetToImageController = WidgetToImagePlus();

  @override
  void onLoad() {
    showSuccess();
  }

  ///保存二维码
  void saveQrCode() async {
    AppDialogUtils.showLoadingDialog();
    Uint8List? imageData = await widgetToImageController.simpleCapture();
    final result = await ImagePickers.saveByteDataImageToGallery(imageData!);
    if (result != null) {
      AppDialogUtils.showToast("已保存至相册");
    } else {
      AppDialogUtils.showToast("保存失败");
    }
    AppDialogUtils.dismissLoadingDialog();
  }
}
