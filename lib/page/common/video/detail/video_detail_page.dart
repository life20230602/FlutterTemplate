import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/common/video/detail/video_detail_logic.dart';
import 'package:get/get.dart';

import '../../../../res/app_asset.dart';
import '../../../../widget/player/app_player.dart';
import '../../../../widget/ticker_provider.dart';
import 'app_vip_cover_player_widget.dart';
import 'video_comment_page.dart';
import 'video_introduction_page.dart';


///视频播放页
class VideoDetailPage extends AppGetXBasePage<VideoDetailLogic> with SingleTickerProvider {
  VideoDetailPage({super.key});

  ///tab选择
  final _tabIndexObs = 0.obs;

  final AppPlayerController appPlayerController = AppPlayerController();

  ///是否显示视频覆盖层
  final _showVideoCoverObs = true.obs;

  @override
  bool showTitle() {
    return false;
  }

  @override
  VideoDetailLogic createController() {
    var vid = int.parse(Get.parameters["vid"]!);
    return VideoDetailLogic(vid: vid);
  }

  @override
  Widget buildChild(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildVideo(),
        _buildTab(),
        Expanded(child: _buildBottomBody()),
      ],
    );
  }

  ///构建视频播放器
  Widget _buildVideo() {
    return Obx(() => AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            children: [
              AppVipCoverPlayerWidget(
                element: logic.videoInfoObs.value!,
                successCallback: () {
                  //购买成功，刷新页面
                  logic.playVideo(logic.videoInfoObs.value!);
                },
                onPlayStartCallback: () {
                  logic.record(logic.videoInfoObs.value!.id);
                },
              ),
              // IconButton(
              //     onPressed: () {
              //       Navigator.maybePop(context);
              //     },
              //     icon: AppAsset.assets.imagesIconVideoDetailBack.toAssetImageWidget(width: 28, height: 28))
            ],
          ),
        ));
  }

  ///简介主体内容
  Widget? _introductionContentWidget;

  ///评论主体内容
  Widget? _commentContentWidget;

  ///底部主体内容
  Widget _buildBottomBody() {
    return Obx(() {
      Widget child;
      if (_tabIndexObs.value == 0) {
        child = _introductionContentWidget ?? (_introductionContentWidget = _buildIntroductionContent());
      } else {
        child = _commentContentWidget ?? (_commentContentWidget = _buildCommentContent());
      }
      var item = logic.videoInfoObs.value;
      return child;
    });
  }

  ///构建视频简介内容
  Widget _buildIntroductionContent() {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: VideoIntroductionPage(
            logic.videoDetailInfoObs.value!,
            onVideoItemClick: (item) {
              logic.playVideo(item);
              _showVideoCoverObs.value = true;
              //移除缓存的底部内容
              _commentContentWidget = null;
              _introductionContentWidget = null;
            },
          ),
        ),
      );
    });
  }

  ///构建评论内容
  Widget _buildCommentContent() {
    return VideoCommentPage(
      vid: logic.vid,
      onSendCommentListener: () {
        //评论完成，数量增加
        logic.commentCountObs.value = logic.commentCountObs.value + 1;
      },
    );
  }

  ///标题
  Widget _buildTab() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: TabBar(
        dividerHeight: 0,
        labelStyle: const TextStyle(fontSize: 15),
        tabs: _buildSortTabs(),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const BoxDecoration(color: Colors.transparent),
        isScrollable: true,
        enableFeedback: false,
        tabAlignment: TabAlignment.start,
        controller: TabController(length: 2, vsync: this),
        labelColor: Colors.white,
        onTap: (index) {
          _tabIndexObs.value = index;
        },
        unselectedLabelColor: Colors.grey,
      ),
    );
  }

  ///排序 tab
  List<Widget> _buildSortTabs() {
    final widgets = [
      const Tab(text: "简介"),
      Obx(() => Tab(text: "评论(${logic.commentCountObs.value})")),
    ];
    return widgets;
  }
}
