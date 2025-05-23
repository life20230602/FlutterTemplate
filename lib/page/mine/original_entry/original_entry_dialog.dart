import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_base_page.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/app_dialog_widget.dart';

import '../../../res/app_asset.dart';
import '../../../widget/component/app_button_widget.dart';

///原创入驻
class OriginalEntryDialog extends AppBasePage {
  OriginalEntryDialog({super.key});

  @override
  Color? backgroundColor() => Colors.transparent;

  @override
  bool isWidgetMode() => true;

  @override
  Widget buildChild(BuildContext context) {
    return AppDialogContainerWidget(
      bottomChild: _buildClose(),
      backgroundColor: context.appTheme.secondBgColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
        child: Column(
          children: [
            Text(
              "原创入驻",
              style: TextStyle(fontSize: 20, color: Colors.white),
              strutStyle: StrutStyle(forceStrutHeight: true),
            ),
            const SizedBox(height: 20),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    Color(0xFFFFE7C3),
                    Color(0xFFEFB96F),
                  ],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Text(
                "联系客服了解相关详情",
                style: TextStyle(fontSize: 16, color: Color(0xFFFFE7C3)),
                strutStyle: StrutStyle(forceStrutHeight: true),
              ),
            ),
            const SizedBox(height: 20),
            AppButtonWidget(
              onTap: () {},
              text: "立即联系",
              textSize: 17,
              height: 44,
              gradient: [Color(0xFFFFE7C3), Color(0xFFEFB96F)],
            ),
          ],
        ),
      ),
    );
  }

  ///关闭按钮
  Widget _buildClose() {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.maybeOf(context)!.pop();
        },
        child: AppAsset.assets.imagesIconClose.toAssetImageWidget(size: 36),
      ),
    );
  }
}
