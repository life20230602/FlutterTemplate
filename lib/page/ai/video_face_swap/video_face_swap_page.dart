import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/ai/strip/strip_logic.dart';

import '../../../widget/component/app_title_right_button_widget.dart';
import 'video_face_swap_logic.dart';

///视频换脸
class VideoFaceSwapPage extends AppGetXBasePage<VideoFaceSwapLogic> {
  VideoFaceSwapPage({super.key});

  @override
  VideoFaceSwapLogic createController() => VideoFaceSwapLogic();

  @override
  String title() => "视频换脸";

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
    return Text("视频换脸");
  }
}
