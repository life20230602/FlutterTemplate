import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/ai/strip/strip_logic.dart';

import '../../../widget/component/app_title_right_button_widget.dart';
import 'face_swap_logic.dart';

///换脸
class FaceSwapPage extends AppGetXBasePage<FaceSwapLogic> {
  FaceSwapPage({super.key});

  @override
  FaceSwapLogic createController() => FaceSwapLogic();

  @override
  String title() => "图片换脸";

  @override
  List<Widget>? titleActions() {
    return [
      AppTitleRightButtonWidget(
        text: "作品记录",
        onTap: (){},
      ),
    ];
  }

  @override
  Widget buildChild(BuildContext context) {
    return Text("换脸");
  }
}
