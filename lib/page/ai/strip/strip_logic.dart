import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../utils/app_dialog_utils.dart';

///脱衣
class StripLogic extends AppGetXBaseLogic {
  ///制作模板
  final templateListObs = [].obs;

  ///选中模板
  final templateIndexObs = 0.obs;

  ///任务照片
  final taskImageObs = "".obs;

  @override
  void onLoad() {
    templateListObs.add("element");
    templateListObs.add("element");
    templateListObs.add("element");
    templateListObs.add("element");
    templateListObs.add("element");
    templateListObs.add("element");
    showSuccess();
  }


  ///选择图片
  void pickerImage() async {
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
      taskImageObs.value = output;
    }
  }

  ///开始提交
  void submit() {}
}
