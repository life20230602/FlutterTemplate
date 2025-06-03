import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/widget/component/app_gradient_text_widget.dart';

///vip 卡片 item
class ZxVipCardItemWidget extends StatelessWidget {
  const ZxVipCardItemWidget({super.key, this.checked = true});

  final bool checked;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 200 / 260,
      child: Stack(
        children: [
          if (checked)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFE7C3), Color(0xFFEFB96F)],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: context.appTheme.secondBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient:
                      checked
                          ? LinearGradient(
                            colors: [Color(0x9036352D), Color(0xA11B1B1B)],
                          )
                          : null,
                ),
                child: _buildContentWidget(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///内容区域
  Widget _buildContentWidget(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 22),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: AppGradientTextWidget(text: "约炮+暗网 金币视频", fontSize: 14,
              textAlign: TextAlign.center,),
            ),
            const SizedBox(height: 4,),
            _buildPrice(),
            Text(
              "原价：¥4000",
              style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
            ),
          ],
        ),
        Positioned(left: 0, top: 0, child: _buildCardName()),
      ],
    );
  }

  ///卡片名字
  Widget _buildCardName() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFE7C3), Color(0xFFEFB96F)],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Text(
        "钻石永久卡",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  ///价格
  Widget _buildPrice() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("200", style: TextStyle(fontSize: 20, color: Colors.white)),
        Text("元", style: TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }
}
