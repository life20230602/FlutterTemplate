import 'package:flutter/cupertino.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/widget/widget_utils.dart';

///底部支付按钮
class BottomPayButtonWidget extends StatelessWidget {
  const BottomPayButtonWidget({super.key, required this.text,this.onTap});

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        toAppButton2(text, textSize: 14,onTap: onTap),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "升级会员/支付问题,请咨询",
              style: TextStyle(
                fontSize: 12,
                color: context.appTheme.whiteColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                //跳转在线客服
              },
              child: Text(
                "【在线客服】",
                style: TextStyle(fontSize: 12, color: context.appTheme.primary),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
