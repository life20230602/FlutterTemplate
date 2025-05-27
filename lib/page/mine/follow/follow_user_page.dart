import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_base_refresh_page.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';

import 'follow_user_logic.dart';

/// 我的关注-用户
class FollowUserPage extends AppGetXBaseRefreshPage<FollowUserLogic> {
  FollowUserPage({super.key});

  @override
  FollowUserLogic createController() => FollowUserLogic();

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
          size: 35,
          radius: 17,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            "datadatadatadatadatdataadatadata",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: context.appTheme.secondBgColor,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
          child: Text("已关注",style: TextStyle(fontSize: 12,color: context.appTheme.secondTextColor)),
        ),
      ],
    );
  }
}
