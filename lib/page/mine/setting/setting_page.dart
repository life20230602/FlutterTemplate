import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mine/apps/apps_logic.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/component/ad_common_widget.dart';
import 'package:flutter_se/widget/component/app_button_widget.dart';
import 'package:get/get.dart';

import 'setting_logic.dart';

/// 账号设置
class SettingPage extends AppGetXBasePage<SettingLogic> {
  SettingPage({super.key});

  @override
  SettingLogic createController() => SettingLogic();

  @override
  String title() => "账号设置";

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: GestureDetector(
              onTap: () {
                logic.pickerImage();
              },
              child: _buildAvatar(),
            ),
          ),
          const SizedBox(height: 10),
          Text("修改头像", style: TextStyle(fontSize: 17)),
          const SizedBox(height: 30),
          _buildItem(AppAsset.assets.imagesIconEdit, "昵称", "111"),
          const SizedBox(height: 10),
          Obx(()=>GestureDetector(
            onTap: (){
              logic.clearCache();
            },
            child: _buildItem(AppAsset.assets.imagesIconTrash, "清理缓存", logic.cacheSizeObs.value),
          )),
        ],
      ),
    );
  }

  Widget _buildItem(String icon, String title, String desc) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.appTheme.secondBgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          icon.toAssetImageWidget(size: 18),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Text(
            desc,
            style: TextStyle(
              fontSize: 13,
              color: context.appTheme.secondTextColor,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: context.appTheme.secondTextColor,
          ),
        ],
      ),
    );
  }

  ///头像
  Widget _buildAvatar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(child: _buildImage()),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white),
          ),
        ),
        AppAsset.assets.imagesIconTakePhoto.toAssetImageWidget(size: 25),
      ],
    );
  }

  _buildImage() {
    return Obx(
      () =>
          logic.avatarDataObs.value != null
              ? Image.memory(
                logic.avatarDataObs.value!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              )
              : logic.avatarUrl.toEncryptNetworkImageWidget(
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
    );
  }
}
