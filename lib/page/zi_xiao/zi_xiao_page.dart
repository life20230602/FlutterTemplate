import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mu_yin/mu_yin_logic.dart';

import 'zi_xiao_logic.dart';

///子笑
class ZiXiaoPage extends AppGetXBasePage<ZiXiaoLogic> {
  ZiXiaoPage({super.key});

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  ZiXiaoLogic createController() => ZiXiaoLogic();

  @override
  Widget buildChild(BuildContext context) {
    return Text("子笑");
  }

}
