import 'package:flutter/material.dart';
import 'package:flutter_se/chewie/chewie.dart';
import 'package:flutter_se/widget/player/short_video_loading_widget.dart';
import 'package:flutter_se/widget/player/video_short_controls.dart';

import 'app_player.dart';

///播放完成回调
typedef OnPlayCompleted = void Function();

///播放开始回调
typedef OnPlayStartCallback = void Function();

/// 短视频播放器封装
class AppShortPlayer extends AppPlayer {
  const AppShortPlayer(super.videoTitle, {
    super.url = "",
    super.autoPlay = true,
    super.visibility = false,
    super.aspectRatio,
    super.coverWidget,
    super.showMuting = true,
    super.showPause = true,
    super.showPosition = true,
    super.allowFullScreen = true,
    super.fill = false,
    super.mute = false,
    super.onPlayCompleted,
    super.onPlayStartCallback,
    super.playerController,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _AppShortPlayerState();
  }
}

class _AppShortPlayerState extends AppPlayerState {
  @override
  Widget buildLoadingWidget() {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (widget.coverWidget != null) widget.coverWidget!,
        _buildBottomLoading(context)
      ],
    );
  }

  @override
  ChewieProgressColors buildProgressColors(){
    return ChewieProgressColors(
      // 进度条
        playedColor: Colors.white,
        handleColor: Colors.white,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.grey);
  }

  ///底部加载样式
  Widget _buildBottomLoading(BuildContext context) {
    return const Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ShortVideoLoadingWidget(),
    );
  }

  @override
  Widget buildCustomControls(){
    return AppShortVideoControls(
      widget.videoTitle,
      showMuting: widget.showMuting,
      showPauseButton: widget.showPause,
      showPosition: widget.showPosition,
    );
  }
}
