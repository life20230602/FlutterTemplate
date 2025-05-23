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

import 'questions_logic.dart';

/// 常见问题
class QuestionsPage extends AppGetXBasePage<QuestionsLogic> {
  QuestionsPage({super.key});

  @override
  QuestionsLogic createController() => QuestionsLogic();

  @override
  String title() => "常见问题";

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    logic.toggleItem(logic.itemList[index]);
                  },
                  child: _buildItem(index),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: logic.itemList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: BoxDecoration(
        color: context.appTheme.secondBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "data",
                  style: TextStyle(
                    fontSize: 14,
                    color: context.appTheme.primary,
                  ),
                  strutStyle: StrutStyle(forceStrutHeight: true),
                ),
              ),
              Obx(() {
                var expand = logic.itemList[index].expandStatus.value;
                if (expand) {
                  return RotatedBox(
                    quarterTurns: 3,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: context.appTheme.primary,
                      size: 12,
                    ),
                  );
                }
                return Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 12,
                );
              }),
            ],
          ),
          _buildItemDesc(index),
        ],
      ),
    );
  }

  ///item 描述
  Widget _buildItemDesc(int index) {
    var item = logic.itemList[index];
    return Obx(() {
      var expand = item.expandStatus.value;
      if (expand) {
        return Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            item.data,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        );
      }
      return SizedBox.shrink();
    });
  }
}
