import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:widgets_to_image_plus/widgets_to_image_plus.dart';
import '../../../utils/app_dialog_utils.dart';

///邀请好友界面
class InviteLogic extends AppGetXBaseLogic {
  final WidgetToImagePlus widgetToImageController = WidgetToImagePlus();

  @override
  void onLoad() {}

  ///保存图片
  void saveImage() async {
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

  ///复制推广链接
  void copyLink(){
    Clipboard.setData(ClipboardData(text: "11"));
    AppDialogUtils.showToast("已复制粘贴板");
  }
}
