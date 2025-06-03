import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../bean/video_list_item_bean.dart';
import '../../../../config/user_manager_utils.dart';
import '../../../../http/rest_api_manager.dart';
import '../../../../route/route_utils.dart';
import '../../../../widget/player/app_player.dart';
import 'video_ad_cover_widget.dart';
import 'video_vip_cover_widget.dart';


///app vip 统一覆盖VIP购买层的播放器
class AppVipCoverPlayerWidget extends StatefulWidget {
  const AppVipCoverPlayerWidget(
      {super.key,
      required this.element,
      required this.successCallback,
      this.onPlayStartCallback});

  final VideoListElement element;
  final Function() successCallback;
  final Function()? onPlayStartCallback;

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<AppVipCoverPlayerWidget> {
  final AppPlayerController appPlayerController = AppPlayerController();

  //是否显示vip覆盖
  bool _showVideoVipCover = true;
  //是否显示广告覆盖
  bool _showVideoAdCover = true;

  @override
  void initState() {
    super.initState();
    _showVideoVipCover = !widget.element.isFree();
    // _showVideoAdCover = !UserManager.get().isAdFreePrivileges() && GlobalConfig().getFrontAdv().isNotEmpty;
  }

  @override
  void didUpdateWidget(covariant AppVipCoverPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _showVideoVipCover = !widget.element.isFree();
    // _showVideoAdCover = !UserManager.get().isAdFreePrivileges() && GlobalConfig().getFrontAdv().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.element.isFree() || !_showVideoVipCover) {
      return Stack(
        children: [
          _buildPlayerWidget(),
          if (!widget.element.permissions)
            Positioned(
              right: 0,
              bottom: 44,
              height: 22,
              child: _buildNoPermissionTip(context),
            ),
          if (_showVideoAdCover) _buildAdCover(widget.element),
        ],
      );
    }
    return Stack(
      fit: StackFit.expand,
      children: [
        widget.element.horizontalCover.toEncryptNetworkImageWidget(),
        _buildVideoCover(widget.element),
        if (_showVideoAdCover) _buildAdCover(widget.element),
      ],
    );
  }

  ///广告
  Widget _buildAdCover(VideoListElement element) {
    return VideoAdCoverWidget(
      videoItem: element,
      onAdComplete: () {
        setState(() {
          _showVideoAdCover = false;
        });
      },
    );
  }

  ///没有权限提醒
  Widget _buildNoPermissionTip(BuildContext context) {
    var video = widget.element;
    return GestureDetector(
      onTap: () {
        if (video.isBuy()) {
          _showBuyDialog(video);
        } else {
          RouteUtils.toVip();
        }
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 9, right: 3),
        decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100))),
        child: video.isVIP()
            ? Text(
                "开通VIP观看完整版",
                style: TextStyle(fontSize: 12, color: context.appTheme.primary),
              )
            : Text(
                "${video.salePrice}金币观看完整版",
                style: TextStyle(fontSize: 12, color: context.appTheme.primary),
              ),
      ),
    );
  }

  ///播放器
  Widget _buildPlayerWidget() {
    final video = widget.element;
    return AppPlayer(
      playerController: appPlayerController,
      visibility: true,
      autoPlay: true,
      key: Key(video.id.toString()),
      video.title,
      coverWidget: video.horizontalCover.toEncryptNetworkImageWidget(),
      onPlayCompleted: () {
        //播放完成，如果不是免费需要重新显示覆盖层
        if (!video.isFree()) {
          setState(() {
            _showVideoVipCover = true;
          });
        }
      },
      onPlayStartCallback: () {
        if (widget.onPlayStartCallback != null) {
          widget.onPlayStartCallback!();
        }
      },
      // url: ApiManager.getPlayUrl(video.id, video.permissions.toString()),
    );
  }

  ///构建视频封面
  Widget _buildVideoCover(VideoListElement element) {
    return VideoCoverWidget(
      videoItem: element,
      onBuyVideoCallback: (VideoListElement item) {
        _showBuyDialog(item);
      },
      onTryPlayerVideoCallback: (VideoListElement item) async {
        setState(() {
          _showVideoVipCover = false;
        });
      },
    );
  }

  void _showBuyDialog(VideoListElement item) {
    // SmartDialog.show(
    //     builder: (context) => VideoBuyPage(
    //           item: item,
    //           successCallback: () {
    //             widget.successCallback();
    //             SmartDialog.dismiss();
    //           },
    //         ),
    //     alignment: Alignment.center);
  }
}
