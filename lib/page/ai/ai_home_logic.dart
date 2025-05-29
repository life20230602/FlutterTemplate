import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/page/ai/aicenter/ai_center_page.dart';
import 'package:flutter_se/page/ai/face_swap/face_swap_page.dart';
import 'package:flutter_se/page/ai/strip/strip_page.dart';
import 'package:flutter_se/page/ai/video_face_swap/video_face_swap_page.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:get/get.dart';

import '../launcher/bean/navigation_item.dart';

class AiHomeLogic extends AppGetXBaseLogic {
  final menuListObs = <NavigationItem>[].obs;

  final currentIndexObs = 0.obs;

  @override
  void onLoad() {
    menuListObs.add(
      NavigationItem(
        "Ai脱衣",
        defaultImage: AppAsset.assets.imagesIconAiStrip,
        activeImage: AppAsset.assets.imagesIconAiStrip,
        activeColor: Get.context!.appTheme.primary,
        body: StripPage(),
      ),
    );
    menuListObs.add(
      NavigationItem(
        "图片换脸",
        defaultImage: AppAsset.assets.imagesIconAiFaceSwap,
        activeImage: AppAsset.assets.imagesIconAiFaceSwap,
        activeColor: Get.context!.appTheme.primary,
        body: FaceSwapPage(),
      ),
    );
    menuListObs.add(
      NavigationItem(
        "视频换脸",
        defaultImage: AppAsset.assets.imagesIconAiVideoFaceSwap,
        activeImage: AppAsset.assets.imagesIconAiVideoFaceSwapActive,
        body: VideoFaceSwapPage(),
      ),
    );
    menuListObs.add(
      NavigationItem(
        "Ai中心",
        defaultImage: AppAsset.assets.imagesIconAiCenter,
        activeImage: AppAsset.assets.imagesIconAiCenterActive,
        body: AiCenterPage(),
      ),
    );
    showSuccess();
  }
}
