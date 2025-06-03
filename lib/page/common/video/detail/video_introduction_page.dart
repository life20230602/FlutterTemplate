import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/common/video/detail/video_introduction_logic.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:get/get.dart';

import '../../../../bean/video_detail_bean.dart';
import '../../../../res/app_asset.dart';
import '../../../../widget/component/ad_common_widget.dart';
import '../../../../widget/component/debounce_gesture_tab_widget.dart';
import '../widget/app_video_item_widget.dart';
import 'video_introduction_recommend.dart';


///视频简介
class VideoIntroductionPage extends AppGetXBasePage<VideoIntroductionLogic> {
  VideoIntroductionPage(this.video,{super.key,required this.onVideoItemClick});

  final VideoDetailBean video;

  final OnVideoItemClick onVideoItemClick;

  @override
  VideoIntroductionLogic createController() {
    return VideoIntroductionLogic(collect: video.isCollect);
  }

  @override
  bool showLoadingPage() {
    return false;
  }

  @override
  bool isWidgetMode() {
    return true;
  }

  @override
  Widget buildChild(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(9, 0, 9, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildVideoTitle(),
          if(video.video.tags != null && video.video.tags!.isNotEmpty)
            const SizedBox(
              height: 20,
            ),
          // if(video.video.tags != null && video.video.tags!.isNotEmpty)
          //   VideoTagWidget(tags: video.video.tags!),
          const SizedBox(
            height: 20,
          ),
          _buildVideoInfo(),
          const SizedBox(
            height: 20,
          ),
          _buildVideoAdInfo(),
          const SizedBox(
            height: 25,
          ),
          _buildSuggestionTitle(),
          const SizedBox(
            height: 12,
          ),
          if (video.suggestion.isNotEmpty) _buildSuggestion(),
        ],
      ),
    );
  }

  ///视频标题
  Widget _buildVideoTitle() {
    return Text(
      video.video.title,
      style: const TextStyle(fontSize: 16, color: Colors.white),
    );
  }

  ///视频操作
  Widget _buildVideoInfo() {
    return Row(
      children: [
        // Expanded(child: _buildVideoInfoItem(AppAsset.assets.imagesIconPlayerSmall, "${video.video.clickCount.toUnit()}播放",null)),
        // Obx(() => ObxWrapper(data: controller.collectStatusObs,child: _buildCollectWidget(controller.collectStatusObs.value),)),
        // _buildVideoInfoItem(AppAsset.assets.imagesIconShare, "分享",null,onTap: (){
        //   RouteUtils.toShare();
        // }),
      ],
    );
  }

  // Widget _buildCollectWidget(bool collect){
  //   if (collect) {
  //     return Expanded(
  //         child: _buildVideoInfoItem(AppAsset.assets.imagesIconCollectActiveSmall, "收藏(${video.video.favoriteCount.toUnit()})",
  //             context.appTheme.primary,onTap: () {
  //           controller.likeVideo(video.video,false);
  //         }));
  //   }
  //   return Expanded(
  //       child: _buildVideoInfoItem(AppAsset.assets.imagesIconCollect, "收藏(${video.video.favoriteCount.toUnit()})",null, onTap: () {
  //         controller.likeVideo(video.video,true);
  //       }));
  // }

  ///创建视频信息的单个
  Widget _buildVideoInfoItem(String icon, String text,Color? iconColor, {Function? onTap}) {
    return DebounceGestureTabWidget(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Row(
        children: [
          icon.toAssetImageWidget(width: 20, height: 20,color: iconColor),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            // style: const TextStyle(fontSize: 12, color: context.appTheme.appGrey),
          )
        ],
      ),
    );
  }

  ///视频中间广告
  Widget _buildVideoAdInfo() {
    return AdBannerWidget(
      adList: video.advs,
      adHeight: AdBannerWidget.AD_SIZE_SMALL,
    );
  }

  ///推荐列表的标题
  Widget _buildSuggestionTitle() {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(color: context.theme.primaryColor, borderRadius: BorderRadius.circular(2)),
        ),
        const SizedBox(width: 5,),
        const Text(
          "精品推荐",
          style: TextStyle(fontSize: 18, color: Colors.white),
        )
      ],
    );
  }

  ///推荐列表
  Widget _buildSuggestion() {
    return VideoRecommendWidget(video.suggestion,onVideoItemClick: onVideoItemClick,);
  }
}
