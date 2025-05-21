import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_base_refresh_page.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/component/app_button_widget.dart';

import 'official_logic.dart';

///官方群
class OfficialPage extends AppGetXBaseRefreshPage<OfficialLogic> {
  OfficialPage({super.key});

  @override
  OfficialLogic createController() => OfficialLogic();

  @override
  bool isWidgetMode() => false;

  @override
  bool enableLoadMore() => false;

  @override
  String title() => "官方群";

  @override
  Widget? buildRefreshBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildItem(index);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: context.appTheme.secondBgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          ClipOval(
            child: AppAsset.assets.imagesIconContactCustomer.toAssetImageWidget(
              size: 40,
            ),
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "商务合作，渠道代理合作渠道代理合作渠道代理合作渠道代理合作",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Text(
                  "代理合作月入百万",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: context.appTheme.secondTextColor,
                  ),
                ),
              ],
            ),
          ),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return AppButtonWidget(
      text: "立即加入",
      height: 28,
      textSize: 14,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
    );
  }
}
