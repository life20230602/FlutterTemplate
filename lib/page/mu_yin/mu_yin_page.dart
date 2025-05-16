import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mu_yin/mu_yin_logic.dart';

///母淫
class MuYinPage extends AppGetXBasePage<MuYinLogic> {
  MuYinPage({super.key});

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  MuYinLogic createController() => MuYinLogic();

  @override
  Widget buildChild(BuildContext context) {
    return Text("母淫");
  }
}
