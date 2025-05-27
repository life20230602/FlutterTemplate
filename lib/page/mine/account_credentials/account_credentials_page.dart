import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mine/apps/apps_logic.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/app_dialog_widget.dart';
import 'package:flutter_se/widget/component/ad_common_widget.dart';
import 'package:flutter_se/widget/component/app_button_widget.dart';
import 'package:flutter_se/widget/widget_utils.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'account_credentials_logic.dart';

/// 账号凭证
class AccountCredentialsPage extends AppGetXBasePage<AccountCredentialsLogic> {
  AccountCredentialsPage({super.key});

  @override
  AccountCredentialsLogic createController() => AccountCredentialsLogic();

  @override
  bool isWidgetMode() => true;

  @override
  Color? backgroundColor() => Colors.transparent;

  @override
  Widget buildChild(BuildContext context) {
    return AppDialogContainerWidget(
      bottomChild: _buildClose(),
      backgroundColor: context.appTheme.secondBgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCode(),
            const SizedBox(height: 8),
            Text(
              "请保存二维码，防丢失",
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              "昵称：丢丢帝都对    ID号：25685896",
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
            const SizedBox(height: 10),
            RepaintBoundary(
              key: logic.widgetToImageController.containerKey,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: QrImageView(
                  data: "1111",
                  size: 160,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "最新地址：http:51kp001.cc\n"
              "官方邮箱:51gfkp@gmail.com\n"
              "发送任意邮件到邮箱获取最新地址",
              style: TextStyle(fontSize: 13, color: Colors.white, height: 1.2),
            ),
            const SizedBox(height: 10),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  ///推广码
  Widget _buildCode() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: context.appTheme.primary,
      ),
      child: Text(
        "推广码：yyy3ij",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  ///关闭按钮
  Widget _buildClose() {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.maybeOf(context)!.pop();
        },
        child: AppAsset.assets.imagesIconClose.toAssetImageWidget(size: 36),
      ),
    );
  }

  ///保存图片
  Widget _buildButton() {
    return toAppButton2(
      "立即保存",
      onTap: () {
        logic.saveQrCode();
      },
      textSize: 17,
    );
  }
}
