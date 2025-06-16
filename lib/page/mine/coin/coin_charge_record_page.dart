import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mine/apps/apps_logic.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/app_divider_widget.dart';
import 'package:flutter_se/widget/component/ad_common_widget.dart';
import 'package:flutter_se/widget/component/app_button_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../widget/bottom_pay_button_widget.dart';
import 'coin_charge_item_widget.dart';
import 'coin_charge_logic.dart';
import 'coin_charge_record_logic.dart';

/// 金币充值记录
class CoinChargeRecordPage extends AppGetXBasePage<CoinChargeRecordLogic> {
  CoinChargeRecordPage({super.key});

  @override
  CoinChargeRecordLogic createController() => CoinChargeRecordLogic();

  @override
  String title() => "充值明细";

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: ListView.separated(
        itemBuilder: (context, index) => _buildItem(context, index),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        },
        itemCount: 20,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10,12,25,12),
      decoration: BoxDecoration(
        color: context.appTheme.itemBgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text("300元", style: TextStyle(fontSize: 14, color: Colors.white))),
              _buildStatus(0),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(child: Text(
                "支付宝支付",
                style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
              )),
              Text(
                "06/14/2024 14:14:14",
                style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ///
  Widget _buildStatus(int status) {
    if (status == 1) {
      return Text(
        "充值失败",
        style: TextStyle(fontSize: 14, color: context.appTheme.appRed),
      );
    }
    return Text(
      "充值成功",
      style: TextStyle(fontSize: 14, color: context.appTheme.primary),
    );
  }
}
