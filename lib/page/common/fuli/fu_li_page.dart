import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/common/fuli/fu_li_logic.dart';
import 'package:flutter_se/res/app_theme.dart';

/// 福利界面
class FuLiPage extends AppGetXBasePage<FuLiLogic> {
  FuLiPage({super.key});

  @override
  FuLiLogic createController() => FuLiLogic();

  @override
  String title() => "福利";

  @override
  Widget buildChild(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return _buildItem(index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10);
      },
      itemCount: 10,
    );
  }

  Widget _buildItem(int index) {
    return AspectRatio(
      aspectRatio: 700 / 300,
      child: Container(
        color: context.appTheme.secondBgColor,
        child: Text("data"),
      ),
    );
  }
}
