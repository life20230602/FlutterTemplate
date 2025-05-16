import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mu_yin/mu_yin_logic.dart';

import 'mine_logic.dart';

///我的
class MinePage extends AppGetXBasePage<MineLogic> {
  MinePage({super.key});


  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  MineLogic createController() => MineLogic();

  @override
  Widget buildChild(BuildContext context) {
    return Text("我的");
  }

}
