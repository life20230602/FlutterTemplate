import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_se/utils/app_dialog_utils.dart';

import '../http/exception/app_server_exception.dart';
import 'app_base_logic.dart';
import 'app_base_refresh_logic.dart';

typedef OnAppServerException = bool Function(AppServerException exception);

extension FutureExt<T> on Future<T> {
  ///显示异常
  void _showException(Object? e) {
    if (e is AppServerException) {
      if (e.message != null && e.message!.isNotEmpty) {
        AppDialogUtils.showToast(e.message!);
      }
      _dispatchCode(e.code);
    } else if (e is HttpException) {
      AppDialogUtils.showToast(e.message);
    } else if (e is DioException) {
      if (e.type == DioExceptionType.cancel) {
        return;
      } else if (e.type == DioExceptionType.connectionTimeout) {
        AppDialogUtils.showToast("服务器连接超时,请检查网络");
      } else if (e.type == DioExceptionType.sendTimeout) {
        AppDialogUtils.showToast("发送数据超时,请检查网络");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        AppDialogUtils.showToast("接收数据超时,请检查网络");
      } else {
        AppDialogUtils.showToast("网络异常,请检查网络");
      }
    } else {
      AppDialogUtils.showToast("网络异常,请检查网络");
    }
  }

  Future<T> catchException(AppGetXBaseLogic controller,
      {bool showErrorPage = true, OnAppServerException? onAppException}) {
    return onError((error, stackTrace) {
      error = error is DioException ? error.error ?? error : error;
      if (error is AppServerException && onAppException != null) {
        //如果外部没有处理异常，继续按原有路径处理
        if (!onAppException(error)) {
          _showException(error);
        }
      } else {
        _showException(error);
      }
      if (kDebugMode) {
        print(stackTrace.toString());
      }
      if (showErrorPage) {
        controller.showError();
      }
      if (controller is AppGetXBaseRefreshLogic) {
        controller.complete(false);
      }
      return Future.error(error ?? "");
    }).catchError(_catchError);
  }

  void _catchError(AppGetXBaseLogic controller, bool showErrorPage) {
    if (showErrorPage) {
      controller.showError();
    }
    if (controller is AppGetXBaseRefreshLogic) {
      controller.complete(false);
    }
  }

  ///错误码处理
  void _dispatchCode(int? code) {
    //登录失效
    if (code == 99991) {}
  }
}
