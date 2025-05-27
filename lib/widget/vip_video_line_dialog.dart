import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_base_page.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/widget/app_dialog_widget.dart';
import 'package:flutter_se/widget/component/app_button_widget.dart';
import 'package:flutter_se/widget/widget_utils.dart';

///vip 视频线路弹窗
class VipVideoLineDialog extends AppBasePage {
  VipVideoLineDialog({super.key, this.onBuy});

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
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "提示",
              style: TextStyle(color: Colors.white, fontSize: 20),
              strutStyle: StrutStyle(forceStrutHeight: true),
            ),
            const SizedBox(height: 25),
            Text(
              "该线路仅限会员使用",
              style: TextStyle(color: Colors.white, fontSize: 16),
              strutStyle: StrutStyle(forceStrutHeight: true),
            ),
            _buildMessage(),
            const SizedBox(height: 25),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return toAppButton2(
      "立即开通VIP",
      textSize: 16,
      onTap: () {
        if (onBuy != null) onBuy!();
      },
    );
  }

  Widget _buildMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "开通会员立享",
          style: TextStyle(color: Color(0xFFA1A1A1), fontSize: 16),
        ),
        const SizedBox(width: 10,),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Color(0xFFFFE7C3), Color(0xFFEFB96F)],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: Text("极速观影体验", style: TextStyle(fontSize: 21)),
        ),
      ],
    );
  }
}
