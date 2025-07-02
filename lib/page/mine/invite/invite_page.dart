import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/component/app_button_widget.dart';
import 'package:flutter_se/widget/component/app_title_right_button_widget.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'invite_logic.dart';
import 'invite_record_page.dart';

///邀请好友界面
class InvitePage extends AppGetXBasePage<InviteLogic> {
  InvitePage({super.key});

  @override
  String title() => "邀请好友";

  @override
  bool showLoadingPage() => false;

  @override
  InviteLogic createController() => InviteLogic();

  @override
  List<Widget>? titleActions() {
    return [
     AppTitleRightButtonWidget(text: "邀请记录", onTap: (){
       Get.to(CoinChargeRecordPage());
     })
    ];
  }

  @override
  Widget buildChild(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 0, 22, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQrCodeArea(),
            const SizedBox(height: 15),
            _buildShareButtons(),
            const SizedBox(height: 30),
            const Text("规则说明：", style: TextStyle(color: Colors.white, fontSize: 17)),
            const SizedBox(height: 6),
            const Text(
              "1.邀请1名好友成功注册即可获得3天VIP，邀请人数无上限；\n"
              "2.邀请说明：点击【保存二维码】或【复制推广链接】获得专属推广链接，推荐分享给其他人下载即可；\n"
              "3.禁止使用非法程序恶意套利，一经发现，账号将永久查封。",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                "邀请步骤",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            Center(
              child: AppAsset.assets.imagesIconInviteArrow.toAssetImageWidget(
                width: 24,
                height: 18,
              ),
            ),
            const SizedBox(height: 15),
            AspectRatio(
              aspectRatio: 640 / 1042,
              child: AppAsset.assets.imagesIconInviteBuZhou.toAssetImageWidget(
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 15),
            _buildQueryInviteRecord(),
          ],
        ),
      ),
    );
  }

  ///分享按钮
  Widget _buildShareButtons() {
    return Row(
      children: [
        Expanded(
          child: AppButtonWidget(
            text: "保存图片",
            height: 41,
            onTap: () {
              logic.saveImage();
            },
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: AppButtonWidget(
            text: "复制推广链接",
            height: 41,
            onTap: () {
              logic.copyLink();
            },
          ),
        ),
      ],
    );
  }

  ///二维码区域
  Widget _buildQrCodeArea() {
    return RepaintBoundary(
      key: logic.widgetToImageController.containerKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: AspectRatio(
          aspectRatio: 640 / 665,
          child: Stack(
            children: [
              AppAsset.assets.imagesIconInviteBg.toAssetImageWidget(
                fit: BoxFit.fill,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 21),
                  Text(
                    "我的推广码",
                    style: TextStyle(
                      fontSize: 20,
                      color: context.appTheme.titleTextColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "ZZEWFW",
                    style: TextStyle(
                      fontSize: 32,
                      color: context.appTheme.primary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: DottedLine(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      lineLength: double.infinity,
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: Color(0xFF313131),
                      dashGapColor: Colors.transparent,
                    ),
                  ),
                  const SizedBox(height: 22),
                  _buildQrCode(),
                  const SizedBox(height: 10),
                  _buildInviteInfo(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///二维码
  Widget _buildQrCode() {
    return QrImageView(data: "12312", size: 142, backgroundColor: Colors.white);
  }

  ///邀请信息
  Widget _buildInviteInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("累计邀请", style: TextStyle(fontSize: 16, color: Colors.white)),
        Text(
          " 0 ",
          style: TextStyle(fontSize: 18, color: context.appTheme.primary),
        ),
        const Text("人", style: TextStyle(fontSize: 18, color: Colors.white)),
      ],
    );
  }

  ///查看推广记录
  Widget _buildQueryInviteRecord() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "去查看",
            style: TextStyle(color: Colors.white, fontSize: 14),
            strutStyle: StrutStyle(forceStrutHeight: true),
          ),
          AppAsset.assets.imagesIconArrowRight.toAssetImageWidget(size: 18),
        ],
      ),
    );
  }
}
