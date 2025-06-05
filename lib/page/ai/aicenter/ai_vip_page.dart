import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'ai_vip_logic.dart';

/// ai 会员
class AiVipPage extends AppGetXBasePage<AiVipLogic> {
  AiVipPage({super.key});

  @override
  AiVipLogic createController() => AiVipLogic();

  @override
  String title() => "2025最新AI技术";

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "请选择会员类型",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 10),
          _buildAiCard(),
          const SizedBox(height: 15),
          _buildCardPermission(),
        ],
      ),
    );
  }

  ///卡片权益
  Widget _buildCardPermission() {
    final children = <Widget>[];
    children.add(_buildPermissionTitle());
    for (int i = 0; i < 4; i++) {
      final color =
          i % 2 == 0 ? const Color(0xFF171819) : const Color(0xFF1C1D1E);
      BorderRadiusGeometry? borderRadius;
      if (i == 3) {
        //最后一个需要底部圆角
        borderRadius = const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)
        );
      }
      children.add(_buildPermissionItem("text$i", "1$i", 13, color,borderRadius));
    }
    return Container(
      decoration: BoxDecoration(
        color: context.appTheme.secondBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: children),
    );
  }

  ///权限 item
  Widget _buildPermissionItem(
    String text,
    String desc,
    double fontSize,
    Color color,
    BorderRadiusGeometry? borderRadius,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(text, style: TextStyle(color: Colors.white, fontSize: fontSize)),
          Text(desc, style: TextStyle(color: Colors.white, fontSize: fontSize)),
        ],
      ),
    );
  }

  ///权限标题
  Widget _buildPermissionTitle() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: const BoxDecoration(
        color: Color(0xFF2E2E2E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: _buildPermissionItem("可享权益", "次数", 14, Colors.transparent,null),
    );
  }

  ///ai 卡片信息
  Widget _buildAiCard() {
    return AlignedGridView.count(
      itemCount: 6,
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            logic.vipCardSelectedIndexObs.value = index;
          },
          child: _buildCardItem(index),
        );
      },
    );
  }

  ///卡片 item
  Widget _buildCardItem(int index) {
    return Obx(() {
      final checked = logic.vipCardSelectedIndexObs.value == index;
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: checked ? null : context.appTheme.secondBgColor,
          borderRadius: BorderRadius.circular(10),
          gradient:
              checked
                  ? const LinearGradient(
                    colors: [Color(0xFF2FCCF7), Color(0xFF00DF39)],
                  )
                  : null,
        ),
        child: Column(
          children: [
            Text(
              "AI月卡",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: (checked ? Colors.black : Colors.white),
              ),
            ),
            Text(
              "¥ 100",
              style: TextStyle(
                fontSize: 12,
                color: (checked ? Colors.black : Colors.white),
              ),
            ),
          ],
        ),
      );
    });
  }
}
