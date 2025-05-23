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

import 'msg_logic.dart';

/// 消息界面
class MsgPage extends AppGetXBasePage<MsgLogic> {
  MsgPage({super.key});

  @override
  MsgLogic createController() => MsgLogic();

  @override
  String title() => "消息";

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          _buildItem(
            AppAsset.assets.imagesIconMsgCustomer,
            "在线客服",
            "有什么问题，建议都可以咨询我",
          ),
          const SizedBox(height: 10),
          _buildItem(AppAsset.assets.imagesIconMsgSystem, "系统消息", null),
          const SizedBox(height: 10),
          _buildItem(AppAsset.assets.imagesIconMsgInteractive, "互动消息", null),
        ],
      ),
    );
  }

  Widget _buildItem(String icon, String title, String? desc) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: context.appTheme.secondBgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          icon.toAssetImageWidget(size: 40, radius: 20),
          const SizedBox(width: 10),
          Expanded(
            child:
                desc != null
                    ? _buildTitleAndDesc(title, desc)
                    : Text(
                      title,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      strutStyle: StrutStyle(forceStrutHeight: true),
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleAndDesc(String title, String desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 15, color: Colors.white),
          strutStyle: StrutStyle(forceStrutHeight: true),
        ),
        const SizedBox(height: 5),
        Text(
          desc,
          style: TextStyle(
            fontSize: 13,
            color: context.appTheme.secondTextColor,
          ),
          strutStyle: StrutStyle(forceStrutHeight: true),
        ),
      ],
    );
  }
}
