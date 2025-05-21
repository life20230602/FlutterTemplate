import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mine/entity/menu_entity.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'invite/invite_page.dart';
import 'mine_logic.dart';

///我的
class MinePage extends AppGetXBasePage<MineLogic> {
  MinePage({super.key});

  @override
  bool isWidgetMode() => true;

  @override
  MineLogic createController() => MineLogic();

  @override
  Widget buildChild(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Column(
            children: [
              _buildTopOperatorWidget(),
              const SizedBox(height: 10),
              _buildUserInfo(),
              const SizedBox(height: 20),
              _buildBanner(),
              const SizedBox(height: 15),
              _buildHistory(),
              const SizedBox(height: 15),
              _buildIconMenu(),
              const SizedBox(height: 15),
              _buildMenu(),
              const SizedBox(height: 10),
              _buildBottomMenu(),
            ],
          ),
        ),
      ),
    );
  }

  ///最底部菜单
  Widget _buildBottomMenu() {
    final widgets = <Widget>[];
    for (var menu in logic.bottomMenuList) {
      widgets.add(_buildMenuItem(menu));
    }
    return Container(
      height: 155,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.appTheme.secondBgColor,
      ),
      child: AlignedGridView.count(
        physics: NeverScrollableScrollPhysics(),
        itemCount: logic.bottomMenuList.length,
        mainAxisSpacing: 15,
        crossAxisCount: 4,
        itemBuilder: (context, index) {
          return _buildMenuItem(logic.bottomMenuList[index]);
        },
      ),
    );
  }

  ///菜单
  Widget _buildMenu() {
    final widgets = <Widget>[];
    for (var menu in logic.menuList) {
      widgets.add(_buildMenuItem(menu));
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.appTheme.secondBgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widgets,
      ),
    );
  }

  ///菜单项
  Widget _buildMenuItem(MenuEntity entity) {
    return GestureDetector(
      onTap: entity.onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          entity.icon.toAssetImageWidget(size: 27),
          SizedBox(height: 4),
          Text(
            entity.name,
            style: TextStyle(fontSize: 13, color: Colors.white),
          ),
        ],
      ),
    );
  }

  ///浏览记录
  Widget _buildHistory() {
    return Row(
      children: [
        AppAsset.assets.imagesIconHistory.toAssetImageWidget(size: 16),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            "浏览记录",
            style: TextStyle(fontSize: 14, color: Colors.white),
            strutStyle: StrutStyle(forceStrutHeight: true),
          ),
        ),
        Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 16),
      ],
    );
  }

  ///横幅
  Widget _buildBanner() {
    return AspectRatio(
      aspectRatio: 350 / 75,
      child: Container(alignment: Alignment.center, child: Text("横幅")),
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
              _buildUserId(),
            ],
          ),
        ),
      ],
    );
  }

  ///用户 id 信息
  Widget _buildUserId() {
    return Row(
      children: [
        Text(
          "ID：154084912",
          style: TextStyle(
            fontSize: 14,
            color: context.appTheme.secondTextColor,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            logic.copyUserId();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppAsset.assets.imagesIconCopy.toAssetImageWidget(size: 16),
              Text(
                "复制",
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

  ///顶部操作栏
  Widget _buildTopOperatorWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppAsset.assets.imagesIconNotification.toAssetImageWidget(size: 23),
        const SizedBox(width: 15),
        AppAsset.assets.imagesIconSetting.toAssetImageWidget(size: 23),
      ],
    );
  }

  ///图标菜单项
  Widget _buildIconMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _buildIconMenuItem(
          AppAsset.assets.imagesIconMineAmount,
          "金币充值",
          "8568",
        )),
        const SizedBox(width: 10),
        Expanded(
          child: _buildIconMenuItem(
            AppAsset.assets.imagesIconMineLunPan,
            "幸运抽奖",
            "惊喜好礼天天送",
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: (){
              Get.to(InvitePage());
            },
            child: _buildIconMenuItem(
              AppAsset.assets.imagesIconMineShare,
              "分享邀请",
              "邀请好友可领VIP",
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIconMenuItem(String icon, String title, String desc) {
    return AspectRatio(
      aspectRatio: 220 / 220,
      child: Stack(
        fit: StackFit.expand,
        children: [
          icon.toAssetImageWidget(fit: BoxFit.fill),
          Padding(
            padding: EdgeInsets.only(left: 12, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  strutStyle: StrutStyle(forceStrutHeight: true),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(desc, style: TextStyle(fontSize: 10, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
