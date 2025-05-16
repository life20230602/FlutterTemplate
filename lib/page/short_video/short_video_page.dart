import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mu_yin/mu_yin_logic.dart';

import 'short_video_logic.dart';

///短视频
class ShortVideoPage extends AppGetXBasePage<ShortVideoLogic> {
  ShortVideoPage({super.key});

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  ShortVideoLogic createController() => ShortVideoLogic();

  @override
  Widget buildChild(BuildContext context) {
    return Text("短视频");
  }

}
