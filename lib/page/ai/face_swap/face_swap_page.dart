import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/ai/strip/strip_logic.dart';

import 'face_swap_logic.dart';

///换脸
class FaceSwapPage extends AppGetXBasePage<FaceSwapLogic> {
  FaceSwapPage({super.key});

  @override
  FaceSwapLogic createController() => FaceSwapLogic();

  @override
  String title() => "图片换脸";

  @override
  Widget buildChild(BuildContext context) {
    return Text("换脸");
  }
}
