import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/utils/app_dialog_utils.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

///自定义换脸
class DiyFaceSwapLogic extends AppGetXBaseLogic {
  //任务照片
  final taskImageObs = "".obs;

  //脸部照片
  final faceImageObs = "".obs;

  @override
  void onLoad() {
    showSuccess();
  }

  ///选择图片 0 表示选择任务照片  1 表示选择脸部照片
  void pickerImage(int type) async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      AppDialogUtils.showLoadingDialog();
      Directory tempDir = await getTemporaryDirectory();
      final output =
          "${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg";
      var result = await FlutterImageCompress.compressAndGetFile(
        file.path,
        output,
        quality: 88,
      );
      AppDialogUtils.dismissLoadingDialog();
      if (result == null) {
        AppDialogUtils.showToast("操作失败，请重试");
        return;
      }
      if (type == 0) {
        taskImageObs.value = output;
      } else {
        faceImageObs.value = output;
      }
    }
  }

  ///开始提交
  void submit() {}
}
