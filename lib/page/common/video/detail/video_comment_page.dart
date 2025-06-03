import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/base/widget/loading_layout.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/utils/int_convert_utils.dart';
import 'package:get/get.dart';

import '../../../../bean/video_comment_bean.dart';
import '../../../../res/app_asset.dart';
import '../../../../widget/comment_input_widget.dart';
import '../../../../widget/component/debounce_gesture_tab_widget.dart';
import '../../../../widget/ticker_provider.dart';
import '../bean/video_comment_bean_ext.dart';
import 'video_comment_logic.dart';

typedef OnSendCommentListener = Function();
///视频评论
class VideoCommentPage extends AppGetXBasePage<VideoCommentLogic> with SingleTickerProvider {
  VideoCommentPage({super.key,required this.onSendCommentListener,required this.vid});

  final OnSendCommentListener onSendCommentListener;

  final int vid;

  @override
  bool isWidgetMode() {
    return true;
  }

  @override
  VideoCommentLogic createController() {
    return VideoCommentLogic(vid: vid,onSendCommentListener: onSendCommentListener);
  }

  @override
  Widget buildChild(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 54),
          child: EasyRefresh(
            controller: logic.refreshController,
            onRefresh: logic.refreshCallback,
            onLoad: logic.loadMoreCallback,
            child: buildRefreshContent(context),
          ),
        ),
        _buildCommentInput(),
      ],
    );
  }

  ///刷新主体内容
  Widget buildRefreshContent(BuildContext context) {
    return Obx(() {
      if (logic.commentListObs.isEmpty) {
        return emptyWidget(desc: "暂无评论");
      }
      return ListView.builder(
          itemCount: logic.commentListObs.length,
          itemBuilder: (context, index) {
            return _buildItem(logic.commentListObs[index]);
          });
    });
  }

  ///构建评论条目
  Widget _buildItem(VideoCommentElementExt item) {
    return Container(
      padding: const EdgeInsets.fromLTRB(13, 10, 13, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItemCover(item),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: _buildItemBody(item)),
        ],
      ),
    );
  }

  ///主体内容
  Widget _buildItemBody(VideoCommentElementExt item) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.nickname,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              item.createdAt.toFormatTimeByRecent(),
              style: TextStyle(fontSize: 10, color: context.appTheme.appGrey),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              item.content,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: context.appTheme.secondBgColor,
            )
          ],
        ),
        _buildCollect(item)
      ],
    );
  }

  ///爱心
  Widget _buildCollect(VideoCommentElementExt item) {
    return Positioned(
        top: 0,
        right: 0,
        child: DebounceGestureTabWidget(
          child: Obx(() => Row(
                children: [
                  if (item.upvoteStateObs.value)
                    AppAsset.assets.imagesIconLike.toAssetImageWidget(width: 15, height: 14, fit: BoxFit.fill
                    ,color: context.appTheme.primary)
                  else
                    AppAsset.assets.imagesIconLike.toAssetImageWidget(width: 15, height: 14, fit: BoxFit.fill),
                  const SizedBox(width: 5,),
                  Container(
                    constraints: const BoxConstraints(minWidth: 10),
                    child: Text(item.likeCount.toUnit()),
                  ),
                ],
              )),
          onTap: () {
            logic.likeComment(item);
          },
        ));
  }

  ///头像
  Widget _buildItemCover(VideoCommentListElement item) {
    return ImageUtils.loadNetworkImage(item.avatar);
  }

  ///评论输入框
  Widget _buildCommentInput() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CommentInputWidget(
            onSubmitted: (text, textEditingController) {
              logic.sendComment(text, textEditingController);
            },
          ),
        ));
  }
}
