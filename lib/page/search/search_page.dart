import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/search/search_logic.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/component/ad_common_widget.dart';
import 'package:flutter_se/widget/component/app_title_right_button_widget.dart';
import 'package:flutter_se/widget/component/search_widget.dart';

///搜索界面
class SearchPage extends AppGetXBasePage<SearchLogic> {
  SearchPage({super.key});

  @override
  SearchLogic createController() => SearchLogic();

  @override
  Widget buildTitle() {
    return Row(
      children: [
        Expanded(
          child: SearchWidget(readOnly: false, controller: logic.controller),
        ),
        const SizedBox(width: 10),
        AppTitleRightButtonWidget(
          text: "搜索",
          textColor: context.appTheme.appGrey,
          onTap: logic.search,
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "历史记录",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          const SizedBox(height: 10),
          _buildSearchRecord(),
          const SizedBox(height: 15),
          AdBannerWidget(),
          const SizedBox(height: 15),
          const Text(
            "热搜推荐",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          const SizedBox(height: 10),
          ..._buildHotSearch(),
        ],
      ),
    );
  }

  ///搜索记录
  Widget _buildSearchRecord() {
    if (logic.searchHistoryKeywords.isEmpty) {
      return const SizedBox.shrink();
    }
    final children = <Widget>[];
    logic.searchHistoryKeywords.forEach((e) {
      children.add(_buildSearchRecordItem(e));
    });
    return Wrap(runSpacing: 10, spacing: 10, children: children);
  }

  ///搜索记录
  Widget _buildSearchRecordItem(String item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: context.appTheme.secondBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        item,
        style: const TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }

  ///热搜
  List<Widget> _buildHotSearch() {
    final widget = <Widget>[];
    for (int i = 0; i < 10; i++) {
      widget.add(_buildHotSearchItem(i));
    }
    return widget;
  }

  Widget _buildHotSearchItem(int index) {
    String image = "";
    if (index == 0) {
      image = AppAsset.assets.imagesIconSearchHot1;
    } else if (index == 1) {
      image = AppAsset.assets.imagesIconSearchHot2;
    } else if (index == 2) {
      image = AppAsset.assets.imagesIconSearchHot3;
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors:
              image.isNotEmpty
                  ? const [Color(0xFF0B2412), Color(0x1A0B2412)]
                  : const [Color(0xFF1C1D1E), Color(0x1A1C1D1E)],
        ),
      ),
      child: Row(
        children: [
          if (image.isEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Text(
                "$index",
                style: TextStyle(fontSize: 14, color: context.appTheme.appGrey),
              ),
            )
          else
            image.toAssetImageWidget(width: 17, height: 22),
          const SizedBox(width: 4),
          Flexible(
            child: Row(
              children: [
                const Flexible(
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    "1231",
                    style: TextStyle(fontSize: 14, color: Color(0xFFB6B6B6)),
                  ),
                ),
                const SizedBox(width: 10),
                AppAsset.assets.imagesIconSearchHotTag.toAssetImageWidget(
                  size: 20,
                ),
              ],
            ),
          ),
          Text(
            "111111",
            style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
          ),
        ],
      ),
    );
  }
}
