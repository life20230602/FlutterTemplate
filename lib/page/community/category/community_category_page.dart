import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';

import 'community_category_logic.dart';

///社区分类列表
class CommunityCategoryPage extends AppGetXBasePage<CommunityCategoryLogic> {
  CommunityCategoryPage({super.key});


  @override
  bool isWidgetMode() => true;

  @override
  bool showLoadingPage() => false;

  @override
  Widget buildChild(BuildContext context) {
    return Text("社区");
  }

  @override
  CommunityCategoryLogic createController() => CommunityCategoryLogic();
}
