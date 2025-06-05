import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/zi_xiao/free/free_logic.dart';

import 'free_item_widget.dart';

///免费看片
class FreePage extends AppGetXBasePage<FreeLogic> {
  FreePage({super.key});

  @override
  FreeLogic createController() => FreeLogic();

  @override
  String title() => "免费看片";

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return const FreeItemWidget();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
        itemCount: 10,
      ),
    );
  }
}
