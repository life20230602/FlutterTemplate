import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_se/config/app_config_utils.dart';
import 'package:flutter_se/utils/decrypt_utils.dart';

import '../../base/http/base_dio.dart';

///域名选择
mixin DomainSelectionMixin {
  var _lineIndex = 0;

  //默认存储桶
  final defaultHost = [
    "https://"
  ];

  ///请求存储桶
  requestHost() async {
    //如果存在配置，配置优先
    if (kDebugMode) {
      onSelectionSuccess("https://1");
      return;
    }
    if (kIsWeb) {
      onSelectionSuccess("https://${Uri.base.host}");
      return;
    }
    var pingDio = BaseDio.getInstance().getPingDio();
    pingDio.options.validateStatus = (status) {
      return status == 200 || (status! >= 400 && status <= 500);
    };
    pingDio.options.responseType = ResponseType.bytes;
    final hostList = defaultHost;

    //选择存储桶
    _selectBucket(pingDio, hostList, (data) async {
      if (data == null) {
        onSelectionError(false);
        return;
      }
      //选择api
      String? ret = await _checkLine(pingDio, data["domain"]);
      if (ret != null && ret.isNotEmpty) {
        onSelectionProgress("线路$_lineIndex检测成功");
        onSelectionSuccess(ret);
        return;
      }
      onSelectionError(true);
    });
  }

  ///选择存储桶
  void _selectBucket(
      Dio pingDio, List<String> hostList, Function(dynamic data) callback) {
    //并发选择存储桶
    final CancelToken bucketCancelToken = CancelToken();
    bool isCallback = false;
    int errorCount = hostList.length;
    for (var bucket in hostList) {
      pingDio.get(bucket, cancelToken: bucketCancelToken).then((value) {
        if (value.statusCode == 200) {
          bucketCancelToken.cancel();
          var decryptHostData = (value.data as Uint8List).decryptHostData();
          var data = jsonDecode(decryptHostData);
          if (!isCallback) {
            isCallback = true;
            callback(data);
          }
        }

      }).onError((error, stacktrace) {
        errorCount--;
        if (errorCount <= 0 && !isCallback) {
          callback(null);
        }
      });
    }
  }

  ///检测线路
  _checkLine(Dio pingDio, dynamic line) async {
    var list = line as List;
    for (int i = 0; i < list.length; i++) {
      _lineIndex++;
      try {
        onSelectionProgress("正在检测线路$_lineIndex");
        await pingDio.get(list[i]);
        return list[i];
      } on Exception catch (e) {
        if (kDebugMode) {
          print("$line===$e");
        }
      }
    }
    return null;
  }

  ///域名选择进度,文本提示
  void onSelectionProgress(String progress);

  ///域名选择失败
  ///apiHostSuccess 存储桶是否请求成功
  void onSelectionError(bool apiHostSuccess);

  ///域名选择成功
  void onSelectionSuccess(String baseUrl);
}
