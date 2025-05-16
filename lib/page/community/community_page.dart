import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/mu_yin/mu_yin_logic.dart';

import 'community_logic.dart';

///社区
class CommunityPage extends AppGetXBasePage<CommunityLogic> {
  CommunityPage({super.key});

  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  Widget buildChild(BuildContext context) {
    return Text("社区");
  }

  @override
  CommunityLogic createController() => CommunityLogic();
}
