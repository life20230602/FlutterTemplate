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
import 'package:flutter_se/widget/component/app_title_right_button_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../widget/bottom_pay_button_widget.dart';
import 'coin_charge_item_widget.dart';
import 'coin_charge_logic.dart';
import 'coin_charge_record_page.dart';

/// 金币充值
class CoinChargePage extends AppGetXBasePage<CoinChargeLogic> {
  CoinChargePage({super.key});

  @override
  CoinChargeLogic createController() => CoinChargeLogic();

  @override
  String title() => "金币充值";

  @override
  List<Widget>? titleActions() {
    return [
      AppTitleRightButtonWidget(
        text: "充值明细",
        onTap: () {
          Get.to(CoinChargeRecordPage());
        },
      ),
    ];
  }

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTop(),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: context.appTheme.secondBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    "官方推荐",
                    style: TextStyle(
                      fontSize: 15,
                      color: context.appTheme.whiteColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: AlignedGridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      itemBuilder: (context, index) {
                        return _buildCoinItem(index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomPayButtonWidget(text: '立即充值￥50'),
        ],
      ),
    );
  }

  ///金币 item
  Widget _buildCoinItem(index) {
    return GestureDetector(
      onTap: () {
        logic.selectedItemObs.value = index;
      },
      child: Obx(
        () =>
            CoinChargeItemWidget(checked: logic.selectedItemObs.value == index),
      ),
    );
  }

  ///顶部信息
  Widget _buildTop() {
    return AspectRatio(
      aspectRatio: 700 / 360,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        decoration: BoxDecoration(
          color: context.appTheme.secondBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("账户余额", style: TextStyle(fontSize: 15, color: Colors.white)),
            Expanded(child: _buildAmount()),
            AppDividerWidget(color: Color(0xFF313131)),
            const SizedBox(height: 15),
            _buildDetail(),
            const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }

  ///明细
  Widget _buildDetail() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "金币明细",
            style: TextStyle(
              fontSize: 15,
              color: context.appTheme.secondTextColor,
            ),
          ),
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: context.appTheme.secondTextColor,
          size: 18,
        ),
      ],
    );
  }

  ///余额
  Widget _buildAmount() {
    return Row(
      children: [
        Text("￥", style: TextStyle(fontSize: 29, color: Colors.white)),
        Text("0.00", style: TextStyle(fontSize: 42, color: Colors.white)),
      ],
    );
  }
}
