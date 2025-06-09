import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/common/app_commom_search_head_widget.dart';
import 'package:flutter_se/page/common/mixin/tab_bar_mixin.dart';
import 'package:flutter_se/page/community/category/community_category_page.dart';
import 'package:flutter_se/page/community/community_detail_logic.dart';
import 'package:flutter_se/page/community/widget/article_link_widget.dart';
import 'package:flutter_se/page/community/widget/html_hr_widget.dart';
import 'package:flutter_se/page/community/widget/html_image_built_widget.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/widget_utils.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../widget/ticker_provider.dart';
import 'community_logic.dart';

///社区-详情
class CommunityDetailPage extends AppGetXBasePage<CommunityDetailLogic> {
  CommunityDetailPage({super.key});

  @override
  CommunityDetailLogic createController() => CommunityDetailLogic();

  @override
  bool titleCenter() => false;

  @override
  Widget buildTitle() {
    return Row(
      children: [
        AppAsset.assets.imagesIconMineShare.toAssetImageWidget(size: 34,radius: 17),
        const SizedBox(width: 10,),
        const Expanded(child: Text("标题",style: TextStyle(fontSize: 17,color: Colors.white),)),
        /// 关注按钮
        GestureDetector(
          onTap: () {
            /// 点击关注 or 取消关注
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 7),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: context.appTheme.primary, width: 1.0),
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Text(
              /*item.followStateObs.value == 0 ? '+ 关注' :*/ "已关注",
              style: TextStyle(
                fontSize: 12,
                color: context.appTheme.primary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 18,)
      ],
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "title",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          _buildDesc(),
          _buildHtmlContent(),
          _buildFollowAndLikeAndShare(),
        ],
      ),
    );
  }

  ///点赞关注区域
  Widget _buildFollowAndLikeAndShare() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppAsset.assets.imagesIconLikeDefault.toAssetImageWidget(size: 16),
        const SizedBox(width: 5),
        Text(
          "1",
          style: TextStyle(fontSize: 14, color: context.appTheme.appGrey),
        ),
        const SizedBox(width: 15),
        AppAsset.assets.imagesIconCommunityStar.toAssetImageWidget(size: 14),
        const SizedBox(width: 5),
        Text(
          "1",
          style: TextStyle(fontSize: 14, color: context.appTheme.appGrey),
        ),
        const SizedBox(width: 15),
        AppAsset.assets.imagesIconCommunityShare.toAssetImageWidget(size: 14),
        const SizedBox(width: 5),
        Text(
          "分享",
          style: TextStyle(fontSize: 14, color: context.appTheme.appGrey),
        ),
      ],
    );
  }

  ///富文本内容
  Widget _buildHtmlContent() {
    final String content =
        "<div>帖子详情内容帖子详情内容帖子详情内容帖子详情内容帖子详情内容帖子详情内容帖子详情内容帖子详情内容帖子详情内容帖子详情内容帖子详情内容帖子详情内容帖子详情内容帖子详情内容</div>";
    return LayoutBuilder(
      builder: (context, constraints) {
        return Html(
          data: content,
          extensions: [
            HtmlDefaultCoverImageBuiltIn(imageWidth: constraints.maxWidth),
            HtmlHrWidget(maxWidth: constraints.maxWidth),
            ArticleLinkWidget(
              maxWidth: constraints.maxWidth,
              articleLinkClickCallback: (id) {
                // Get.offAndToNamed(RouteUtils.blogPostDetail,
                //     arguments: {
                //       Constants.postId: id,
                //       Constants.navigationType: navigationType
                //     });
              },
            ),
          ],

          /// 把html中的 \n 换行符显式替换为 <br>
          style: {
            "body": Style(
              display: Display.block,
              padding: HtmlPaddings.zero,
              color: context.appTheme.whiteColor,
              whiteSpace: WhiteSpace.pre,
            ),
          },
        );
      },
    );
  }

  ///描述信息
  Widget _buildDesc() {
    return Row(
      children: [
        Expanded(
          child: Text(
            "3770.27万浏览",
            style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
          ),
        ),
        Text(
          "发布时间",
          style: TextStyle(fontSize: 12, color: context.appTheme.appGrey),
        ),
      ],
    );
  }
}
