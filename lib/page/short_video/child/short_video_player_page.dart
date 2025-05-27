import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_se/page/short_video/child/widget/short_bottom_widget.dart';
import 'package:flutter_se/page/short_video/child/widget/short_vip_cover_widget.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/utils/int_convert_utils.dart';
import 'package:flutter_se/widget/component/app_back_button_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../base/page/app_base_refresh_page.dart';
import '../../../bean/video_list_item_bean.dart';
import '../../../config/global_config_manager.dart';
import '../../../config/user_manager_utils.dart';
import '../../../res/app_asset.dart';
import '../../../route/route_utils.dart';
import '../../../widget/component/ad_common_widget.dart';
import '../../../widget/component/debounce_gesture_tab_widget.dart';
import '../../../widget/player/app_short_player.dart';
import 'bean/short_video_list_element_ext.dart';
import 'short_video_player_logic.dart';

///短视频播放页面
class ShortVideoPlayerPage
    extends AppGetXBaseRefreshPage<ShortVideoPlayerLogic> {
  ShortVideoPlayerPage({super.key, this.tempList, this.index = 0});

  final List<VideoListElement>? tempList;

  final int index;

  @override
  bool enableTopSafeArea() {
    return false;
  }

  @override
  bool showTitle() {
    return false;
  }

  @override
  bool enableRefresh() {
    return false;
  }

  @override
  Widget buildChild(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        super.buildChild(context),
        Positioned(left: 9, top: kToolbarHeight / 2, child: AppBackButton()),
      ],
    );
  }

  @override
  Widget? buildRefreshBody(BuildContext context) {
    return _buildBody();
  }

  @override
  ShortVideoPlayerLogic createController() {
    return ShortVideoPlayerLogic(tempList: tempList, index: index);
  }

  ///主体内容
  Widget _buildBody() {
    return Obx(
      () => PageView.builder(
        controller: logic.pageController,
        itemCount: _calculateItemCount(),
        onPageChanged: (index) {
          int videoIndex = _getVideoIndex(index);
          //不是vip才需要刷新
          if (!UserManager.get().isVip()) {
            // controller.refreshUserInfo();
          }
          if (videoIndex > logic.itemList.length - 3) {
            //如果只剩下3个了触发加载更多
            logic.startLoadMore();
          }
        },
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          if (_isAdItem(index)) {
            return _buildAdItem(context);
          } else {
            int videoIndex = _getVideoIndex(index);
            return _buildItem(context, videoIndex);
          }
        },
      ),
    );
  }

  bool _isAdItem(int index) {
    // if (GlobalConfig().getShortAd().isEmpty) {
    //   return false;
    // }
    // 每5个视频后的项是广告
    return (index + 1) % 6 == 0;
  }

  int _getVideoIndex(int pageIndex) {
    // 计算实际的视频索引，考虑广告的存在
    return pageIndex - (pageIndex ~/ 6);
  }

  int _calculateItemCount() {
    // 计算总项数，包括视频和广告
    int videoCount = logic.itemList.length;
    // if (GlobalConfig().getShortAd().isEmpty) {
    //   return videoCount;
    // }
    int adCount = videoCount ~/ 5;
    return videoCount + adCount;
  }

  ///短视频随机广告
  Widget _buildAdItem(BuildContext context) {
    var shortAd = [];
    var nextInt = Random().nextInt(shortAd.length);
    return AdBannerWidget(adList: [shortAd[nextInt]]);
  }

  ///构建item
  Widget _buildItem(BuildContext context, int index) {
    final item = logic.itemList[index];
    //写外面是为了防止刷新
    final isMute = logic.muteStatusObs.value;
    return Obx(() {
      final value = logic.vipStatusObs.value;
      return Stack(
        children: [
          AppShortPlayer(
            aspectRatio: 0,
            item.title,
            playerController: logic.playerController,
            fill: true,
            coverWidget: item.horizontalCover.toEncryptNetworkImageWidget(
              fit: BoxFit.fill,
            ),
            allowFullScreen: false,
            showMuting: false,
            showPosition: false,
            showPause: false,
            mute: isMute,
            url: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8",
            onPlayStartCallback: () {
              logic.record(item.id);
            },
            onPlayCompleted: () {
              if (!UserManager.get().isVip()) {
                ShortVideoVipCoverDialogWidget.show();
              }
            },
          ),
          _buildVideoInfo(item),
          _buildVideoRightInfo(context, item),
        ],
      );
    });
  }

  ///创建视频底部描述信息
  Widget _buildVideoInfo(VideoListElement item) {
    return Positioned(bottom: 0, left: 12, child: ShortBottomInfoWidget(item));
  }

  ///创建视频右侧操作
  Widget _buildVideoRightInfo(
    BuildContext context,
    ShortVideoListElementExt item,
  ) {
    return Positioned(
      right: 10,
      bottom: 32,
      child: Column(
        children: [
          _buildAvatar(context, item),
          const SizedBox(height: 18),
          _buildLike(context, item),
          const SizedBox(height: 18),
          _buildComment(context, item),
          const SizedBox(height: 18),
          _buildShare(context, item),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  ///头像
  Widget _buildAvatar(BuildContext context, ShortVideoListElementExt item) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            //跳转博主首页
          },
          child: item.uploaderAvatar.toEncryptNetworkImageWidget(
            width: 40,
            height: 40,
            radius: 20,
          ),
        ),
        GestureDetector(
          onTap: () {
            logic.clickFocus(item);
          },
          child: Container(
            width: 18,
            margin: const EdgeInsets.only(top: 40 - 9, left: 40 / 2 - 9),
            height: 18,
            child: Obx(() {
              //关注过不显示+号
              if (item.isFocusObs.isFalse) {
                return AppAsset.assets.imagesIconFollowUser.toAssetImageWidget(
                  width: 8,
                  height: 8,
                );
              }
              return const SizedBox.shrink();
            }),
          ),
        ),
      ],
    );
  }

  ///点赞
  Widget _buildLike(BuildContext context, ShortVideoListElementExt item) {
    return DebounceGestureTabWidget(
      onTap: () {
        logic.clickLike(item);
      },
      child: Obx(
        () => Column(
          children: [
            if (item.isUpvoteObs.isTrue)
              AppAsset.assets.imagesIconLikeLarge.toAssetImageWidget(
                size: 31,
                fit: BoxFit.fill,
                color: Colors.red,
              ),
            if (item.isUpvoteObs.isFalse)
              AppAsset.assets.imagesIconLikeLarge.toAssetImageWidget(
                size: 31,
                fit: BoxFit.fill,
              ),
            Text(
              item.upvoteCount.toUnit(),
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  ///评论
  Widget _buildComment(BuildContext context, ShortVideoListElementExt item) {
    return DebounceGestureTabWidget(
      onTap: () {
        logic.clickLike(item);
      },
      child: Column(
        children: [
          AppAsset.assets.imagesIconComment.toAssetImageWidget(
            size: 31,
            fit: BoxFit.fill,
          ),
          Text(
            item.commentCount.toUnit(),
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }

  ///分享
  Widget _buildShare(BuildContext context, ShortVideoListElementExt item) {
    return GestureDetector(
      onTap: () {
        // RouteUtils.toShare();
      },
      child: Column(
        children: [
          AppAsset.assets.imagesIconShare.toAssetImageWidget(size: 31),
          const Text("分享", style: TextStyle(fontSize: 12, color: Colors.white)),
        ],
      ),
    );
  }
}
