import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_base_page.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/route/route_utils.dart';
import 'package:flutter_se/widget/app_dialog_widget.dart';
import 'package:flutter_se/widget/component/app_button_widget.dart';
import 'package:flutter_se/widget/widget_utils.dart';

///暗网天堂 消费 权限提示
class AWVConsumePermissionDialog extends AppBasePage {
  AWVConsumePermissionDialog({super.key});

  @override
  Color? backgroundColor() => Colors.transparent;

  @override
  bool isWidgetMode() => true;

  @override
  Widget buildChild(BuildContext context) {
    return AppDialogContainerWidget(
      backgroundColor: context.appTheme.secondBgColor,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "提示",
              style: TextStyle(color: Colors.white, fontSize: 20),
              strutStyle: StrutStyle(forceStrutHeight: true),
            ),
            const SizedBox(height: 25),
            Text(
              "【暗网天堂】",
              style: TextStyle(color: context.appTheme.primary, fontSize: 16),
              strutStyle: const StrutStyle(forceStrutHeight: true),
            ),
            const SizedBox(height: 10),
            const Text(
              textAlign: TextAlign.center,
              "仅对本平台消费200元以上用户开放\n您当前消费未满200元，请充值后进行访问",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(height: 25),
            toAppButton2(
              "立即充值",
              textSize: 16,
              onTap: () {
                Navigator.pop(context);
                RouteUtils.toCoinCharge();
              },
            ),
          ],
        ),
      ),
    );
  }
}
