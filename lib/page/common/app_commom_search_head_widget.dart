import 'package:flutter/cupertino.dart';
import 'package:flutter_se/page/common/fuli/fu_li_page.dart';
import 'package:flutter_se/page/search/search_page.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:get/get.dart';

import '../../res/app_asset.dart';
import '../../widget/component/app_back_button_widget.dart';
import '../../widget/component/search_widget.dart';

/// app 通用搜索头部
class AppCommonSearchHeadWidget extends StatelessWidget {
  const AppCommonSearchHeadWidget({super.key, this.showBack = true});

  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        if (showBack) const AppBackButton(),
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onTap: () {
              Get.to(SearchPage());
            },
            child: const SearchWidget(),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Get.to(() => FuLiPage());
          },
          child: AppAsset.assets.imagesIconMuYinTitleMenu.toAssetImageWidget(
            width: 41,
            height: 36,
          ),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
