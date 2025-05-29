import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/ai/strip/strip_logic.dart';

///脱衣
class StripPage extends AppGetXBasePage<StripLogic> {
  StripPage({super.key});

  @override
  StripLogic createController() => StripLogic();

  @override
  String title() => "Ai脱衣";

  @override
  Widget buildChild(BuildContext context) {
    return Text("脱衣");
  }
}
