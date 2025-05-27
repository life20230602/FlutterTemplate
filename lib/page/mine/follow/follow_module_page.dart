import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_base_refresh_page.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';

import 'follow_module_logic.dart';
import 'follow_user_logic.dart';

/// 我的关注-模块
class FollowModulePage extends AppGetXBaseRefreshPage<FollowModuleLogic> {
  FollowModulePage({super.key});

  @override
  FollowModuleLogic createController() => FollowModuleLogic();

  @override
  Widget? buildRefreshBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 20, 12, 0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _buildItem(index);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        },
        itemCount: logic.itemList.length,
      ),
    );
  }

  Widget _buildItem(index) {
    return Row(
      children: [
        AppAsset.assets.imagesIconMineShare.toAssetImageWidget(
          size: 100,
          radius: 5,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "datadatadatadatadd打算atdataadatadata",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              _buildFollowTag(),
              const SizedBox(height: 4),
              _buildNums()
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNums() {
    return Row(
      children: [
        Text(
          "2847个贴子",
          style: TextStyle(fontSize: 12, color: Color(0xFFBDBDBD)),
        ),
        Text(
          "3770.27万浏览",
          style: TextStyle(fontSize: 12, color: Color(0xFFBDBDBD)),
        ),
      ],
    );
  }

  Widget _buildFollowTag() {
    return Container(
      decoration: BoxDecoration(
        color: context.appTheme.secondBgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      child: Text(
        "已关注",
        style: TextStyle(fontSize: 12, color: context.appTheme.secondTextColor),
      ),
    );
  }
}
