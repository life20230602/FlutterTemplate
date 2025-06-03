import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mine/widget/bottom_pay_button_widget.dart';
import 'package:flutter_se/page/zi_xiao/vip/zx_vip_card_item_widget.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/app_dialog_utils.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:get/get.dart';

import '../../../widget/component/app_gradient_text_widget.dart';
import '../../mine/vip/dialog_bottom_pay_widget.dart';
import 'zx_vip_logic.dart';

/// 子笑的 vip 界面
class ZxVipPage extends AppGetXBasePage<ZxVipLogic> {
  ZxVipPage({super.key});

  @override
  ZxVipLogic createController() => ZxVipLogic();

  @override
  String title() => "会员中心";

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: const SizedBox(height: 10)),
                SliverToBoxAdapter(child: _buildUserInfo()),
                SliverToBoxAdapter(child: const SizedBox(height: 25)),
                SliverToBoxAdapter(child: _buildBodyTitle()),
                SliverToBoxAdapter(child: const SizedBox(height: 15)),
                SliverToBoxAdapter(child: _buildBody()),
                SliverToBoxAdapter(child: const SizedBox(height: 30)),
                SliverToBoxAdapter(
                  child: Center(
                    child: Text("会员专属权益", style: TextStyle(fontSize: 20)),
                  ),
                ),
                SliverToBoxAdapter(child: const SizedBox(height: 10)),
                SliverToBoxAdapter(child: _buildVipPermission()),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              "VIP升级福利：补差价,升级高级会员",
              style: TextStyle(fontSize: 12, color: Color(0xFFFFE7C3)),
            ),
          ),
          BottomPayButtonWidget(
            text: "立即支付 ¥200",
            onTap: () {
              AppDialogUtils.showBottomSheet(DialogBottomPay());
            },
          ),
        ],
      ),
    );
  }

  ///会员权益
  Widget _buildVipPermission() {
    return Text("VIP视频免费看");
  }

  ///主体内容标题
  Widget _buildBodyTitle() {
    return Row(
      children: [
        Expanded(
          child: AppGradientTextWidget(text: "开通VIP享受会员特权", fontSize: 14),
        ),
        AppGradientTextWidget(text: "早买早享受", fontSize: 14),
      ],
    );
  }

  ///主体内容
  Widget _buildBody() {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        separatorBuilder: (context,index){
          return const SizedBox(width: 10,);
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              logic.vipCheckedIndexObs.value = index;
            },
            child: Obx(
                  () => ZxVipCardItemWidget(
                checked: logic.vipCheckedIndexObs.value == index,
              ),
            ),
          );
        },
      ),
    );
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
              Text(
                "名字名字名字名字名字名字名字名字",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              Text(
                "开通会员免费看大片",
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
