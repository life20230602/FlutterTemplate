import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/utils/app_dialog_utils.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

/// 账号设置
class SettingLogic extends AppGetXBaseLogic {
  //选择的图片地址
  final avatarUrlObs = "".obs;

  //服务器头像地址
  String avatarUrl = "";

  ///缓存文件大小
  final cacheSizeObs = "".obs;

  @override
  void onLoad() {
    loadCache();
  }

  ///加载缓存
  Future<Null> loadCache() async {
    Directory tempDir = await getTemporaryDirectory();
    double value = await _getTotalSizeOfFilesInDir(tempDir);
    cacheSizeObs.value = _renderSize(value);
    showSuccess();
  }

  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      for (final FileSystemEntity child in children) {
        total += await _getTotalSizeOfFilesInDir(child);
      }
      return total;
    }
    return 0;
  }

  String _renderSize(double value) {
    List<String> unitArr =
        []
          ..add('B')
          ..add('K')
          ..add('M')
          ..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  ///清除缓存
  void clearCache() async {
    AppDialogUtils.showLoadingDialog();
    Directory tempDir = await getTemporaryDirectory();
    //删除缓存目录
    await _delDir(tempDir);
    cacheSizeObs.value = "0.00B";
    AppDialogUtils.dismissLoadingDialog();
    AppDialogUtils.showToast('清除缓存成功');
  }

  ///递归方式删除目录
  Future<Null> _delDir(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await _delDir(child);
      }
    }
    await file.delete();
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
      if (result != null) {
        avatarUrlObs.value = result.path;
      }
    }
  }
}
