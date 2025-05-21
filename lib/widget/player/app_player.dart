import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/widget/player/video_controls.dart';
import 'package:video_player_platform_interface/video_player_platform_interface.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../chewie/center_play_button.dart';
import '../../chewie/chewie_player.dart';
import '../../chewie/chewie_progress_colors.dart';

///播放完成回调
typedef OnPlayCompleted = void Function();

///播放开始回调
typedef OnPlayStartCallback = void Function();

/// 播放器封装
class AppPlayer extends StatefulWidget {
  const AppPlayer(
    this.videoTitle, {
    this.url = "",
    this.autoPlay = true,
    this.visibility = false,
    this.aspectRatio,
    this.coverWidget,
    this.showMuting = true,
    this.showPause = true,
    this.showPosition = true,
    this.allowFullScreen = true,
    this.fill = false,
    this.mute = false,
    this.onPlayCompleted,
    this.onPlayStartCallback,
    this.playerController,
    super.key,
  });

  final String url;
  final String videoTitle;
  final bool autoPlay;
  final bool allowFullScreen;
  final bool showMuting;
  final bool showPause;
  final bool showPosition;
  final double? aspectRatio;
  final bool visibility; //是否可见，默认内部感知状态
  final OnPlayCompleted? onPlayCompleted;
  final OnPlayStartCallback? onPlayStartCallback;
  final Widget? coverWidget;
  final AppPlayerController? playerController;
  final bool? fill; //是否全屏播放器
  final bool? mute; //是否静音

  @override
  State<StatefulWidget> createState() {
    return AppPlayerState();
  }
}

class AppPlayerState extends State<AppPlayer> {
  // 视频播放控制器
  VideoPlayerController? _controller;
  ChewieController? _cheWieController;

  bool visibility = false;

  //是否播放完成
  bool isPlayerCompleted = false;

  //是否回调了开始播放
  bool isCallbackStartPlayer = false;

  @override
  void initState() {
    super.initState();
    visibility = widget.visibility;
  }

  /// 播放完成监听
  void _listener() {
    if (_controller == null) {
      return;
    }
    var curPosition = _controller!.value.position.inMilliseconds;
    var totalPosition = _controller!.value.duration.inMilliseconds;
    if (!isCallbackStartPlayer && curPosition > 0 && widget.onPlayStartCallback != null) {
      widget.onPlayStartCallback!();
      isCallbackStartPlayer = true;
    }
    if (curPosition < totalPosition) {
      isPlayerCompleted = false;
    }
    if (curPosition >= totalPosition && _controller!.value.isCompleted && !isPlayerCompleted) {
      if (totalPosition == 0) {
        return;
      }
      isPlayerCompleted = true;
      if (widget.onPlayCompleted != null) {
        widget.onPlayCompleted!();
      }
    }
  }

  @override
  void dispose() {
    disposePlayer();
    super.dispose();
  }

  void disposePlayer() {
    _controller?.removeListener(_listener);
    _cheWieController?.dispose();
    _controller?.dispose();
    _cheWieController = null;
    _controller = null;
  }

  //是否可见检测
  void onVisibility(bool visible) {
    visibility = visible;
    if (_controller == null) {
      return;
    }
    if (visible && widget.autoPlay) {
      if (!isPlayerCompleted) {
        _controller!.play();
      }
    } else {
      _controller!.pause();
    }
  }

  Future<bool> _started() async {
    if (_controller != null) {
      disposePlayer();
    }
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url),
        videoPlayerOptions: VideoPlayerOptions(webOptions: VideoPlayerWebOptions(fit: widget.fill! ? Fit.fitFill : null)));
    widget.playerController?.init(_controller);
    await _controller?.initialize();
    if (_controller != null) {
      _cheWieController = ChewieController(
        videoPlayerController: _controller!,
        allowFullScreen: widget.allowFullScreen,
        showOptions: false,
        aspectRatio: widget.aspectRatio,
        errorBuilder: _buildError,
        // 播放速度
        materialProgressColors: buildProgressColors(),
        customControls: buildCustomControls(),
        autoPlay: widget.autoPlay && visibility,
        autoInitialize: true,
      );
      _controller?.addListener(_listener);
    }
    if (widget.mute != null && widget.mute!) {
      _controller!.setVolume(0.0);
    }
    return Future.value(true);
  }

  ChewieProgressColors buildProgressColors(){
    return ChewieProgressColors(
      // 进度条
        playedColor: Colors.white,
        handleColor: Colors.white,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.grey);
  }

  Widget buildCustomControls(){
    return AppVideoControls(
      widget.videoTitle,
      showMuting: widget.showMuting,
      showPauseButton: widget.showPause,
      showPosition: widget.showPosition,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _started(),
        builder: (context, snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return _buildError(context, "播放失败，请重试");
            } else {
              // 请求成功，显示数据
              return widget.visibility
                  ? Chewie(
                      controller: _cheWieController!,
                    )
                  : VisibilityDetector(
                      key: Key(widget.url),
                      onVisibilityChanged: (VisibilityInfo info) {
                        onVisibility(info.visibleFraction >= 0.56);
                      },
                      child: Chewie(
                        controller: _cheWieController!,
                      ),
                    );
            }
          } else {
            // 请求未结束，显示loading
            return buildLoadingWidget();
          }
        });
  }

  Widget buildLoadingWidget(){
    return Stack(
      fit: StackFit.expand,
      children: [
        if (widget.coverWidget != null) widget.coverWidget!,
        Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: context.theme.primaryColor,
          ),
        )
      ],
    );
  }

  /// 播放错误
  Widget _buildError(BuildContext context, String errorMessage) {
    var child = Center(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          CenterPlayButton(
            isFinished: true,
            backgroundColor: Colors.black54,
            iconColor: Colors.white,
            show: true,
            isPlaying: false,
            onPressed: () {
              setState(() {});
            },
          ),
          const Text("播放失败，点击重试"),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // 拦截所有事件
      onTap: _started,
      child: child,
    );
  }
}

///播放器的控制器
class AppPlayerController {
  VideoPlayerController? _videoPlayerController;

  void init(VideoPlayerController? videoPlayerController) {
    _videoPlayerController = videoPlayerController;
  }

  Future<void> pause() async {
    await _videoPlayerController?.pause();
  }

  Future<void> play() async {
    await _videoPlayerController?.play();
  }

  Future<void> toggleMute() async {
    final volume = _videoPlayerController?.value.volume;
    if (volume == 0) {
      await _videoPlayerController?.setVolume(0.5);
    } else {
      await _videoPlayerController?.setVolume(0.0);
    }
  }

  ///是否静音
  bool isMute() {
    return _videoPlayerController?.value.volume == 0.0;
  }
}
