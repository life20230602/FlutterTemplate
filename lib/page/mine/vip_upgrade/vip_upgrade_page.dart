import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mine/apps/apps_logic.dart';
import 'package:flutter_se/page/mine/vip_upgrade/vip_upgrade_logic.dart';
import 'package:flutter_se/page/mine/widget/bottom_pay_button_widget.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/app_dialog_utils.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/component/ad_common_widget.dart';
import 'package:flutter_se/widget/component/app_button_widget.dart';
import 'package:flutter_se/widget/widget_utils.dart';

import 'dialog_bottom_pay.dart';

/// 会员升级
class VipUpgradePage extends AppGetXBasePage<VipUpgradeLogic> {
  VipUpgradePage({super.key});

  @override
  VipUpgradeLogic createController() => VipUpgradeLogic();

  @override
  String title() => "会员升级";

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          _buildUserInfo(),
          const SizedBox(height: 15),
          _buildBody(),
          const SizedBox(height: 10),
          Center(child: Text(
            "VIP升级福利：补差价,升级高级会员",
            style: TextStyle(fontSize: 12, color: Color(0xFFFFE7C3)),
          ),),
          BottomPayButtonWidget(text: "立即支付 ¥200",onTap: (){
            AppDialogUtils.showBottomSheet(DialogBottomPay());
          },)
        ],
      ),
    );
  }

  ///主体内容
  Widget _buildBody() {
    return Expanded(child: ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 700 / 300,
          child: AppAsset.assets.imagesIconMineShare.toAssetImageWidget(radius: 5
          ,fit: BoxFit.cover),
        );
      },
      itemCount: 5,
    ));
  }

  ///用户信息
  Widget _buildUserInfo() {
    return Row(
      children: [
        _buildAvatar(),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "名字名字名字名字名字名字名字名字",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 68,
                    height: 22,
                    child: toAppButton2("充值记录", textSize: 12),
                  ),
                ],
              ),
              Text(
                "铂金年卡  到期时间：2025-06-02",
                style: TextStyle(
                  fontSize: 14,
                  color: context.appTheme.secondTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///头像
  Widget _buildAvatar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: AppAsset.assets.imagesIconSetting.toAssetImageWidget(
            size: 56,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
