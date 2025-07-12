import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_base_page.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/widget/app_dialog_widget.dart';
import 'package:flutter_se/widget/component/app_button_widget.dart';
import 'package:flutter_se/widget/widget_utils.dart';

///余额不足弹窗
class NoBalanceDialog extends AppBasePage {
  NoBalanceDialog({super.key, this.onBuy});

  ///立即开通回调
  final Function()? onBuy;

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
              "金币不足",
              style: TextStyle(color: Colors.white, fontSize: 20),
              strutStyle: StrutStyle(forceStrutHeight: true),
            ),
            const SizedBox(height: 25),
            const Text(
              "您观看的此视频需要金币购买",
              style: TextStyle(color: Colors.white, fontSize: 16),
              strutStyle: StrutStyle(forceStrutHeight: true),
            ),
            const SizedBox(height: 10),
            const Text(
              "一次购买 永久免费看",
              style: TextStyle(color: Color(0xFFA1A1A1), fontSize: 16),
              strutStyle: StrutStyle(forceStrutHeight: true),
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Color(0xFFFFE7C3), Color(0xFFEFB96F)],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: const Text("20 金币", style: TextStyle(fontSize: 21)),
            ),
            const Text(
              "可用金币: 10金币",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(height: 25),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: AppButtonWidget(
            text: "前往充值",
            textSize: 16,
            height: 41,
            gradient: const [Color(0xFF3CA55C), Color(0xFFB5AC49)],
            onTap: (){
              //跳转充值
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: toAppButton2(
            "立即开通",
            textSize: 16,
            onTap: () {
              if (onBuy != null) onBuy!();
            },
          ),
        ),
      ],
    );
  }
}
