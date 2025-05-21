import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../chewie/animated_play_pause.dart';
import '../../chewie/chewie.dart';
import '../../chewie/helpers/utils.dart';
import '../../chewie/material/widgets/options_dialog.dart';
import '../../chewie/notifiers/player_notifier.dart';
import '../../chewie/progress_bar.dart';
import '../../res/app_asset.dart';

class AppVideoControls extends StatefulWidget {
  const AppVideoControls(
    this.title, {
    this.showPlayButton = true,
    this.showPauseButton = true,
    this.showMuting = true,
    this.showTopBar = false,
    this.showPosition = true,
    super.key,
  });

  final bool showPlayButton;
  final bool showTopBar;
  final bool showPauseButton;
  final bool showMuting;
  final bool showPosition;

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MaterialDesktopControlsState();
  }
}

class _MaterialDesktopControlsState extends State<AppVideoControls> with SingleTickerProviderStateMixin {
  late PlayerNotifier notifier;
  late VideoPlayerValue _latestValue;
  double? _latestVolume;
  Timer? _hideTimer;
  Timer? _initTimer;
  late var _subtitlesPosition = Duration.zero;
  bool _subtitleOn = false;
  Timer? _showAfterExpandCollapseTimer;
  bool _dragging = false;
  bool _displayTapped = false;
  Timer? _bufferingDisplayTimer;
  bool _displayBufferingIndicator = false;

  final barHeight = 25.0 * 1.5;
  final marginSize = 5.0;

  late VideoPlayerController controller;
  ChewieController? _chewieController;

  // We know that _chewieController is set in didChangeDependencies
  ChewieController get chewieController => _chewieController!;

  @override
  void initState() {
    super.initState();
    notifier = Provider.of<PlayerNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    if (_latestValue.hasError) {
      var errorWidget = chewieController.errorBuilder?.call(
        context,
        chewieController.videoPlayerController.value.errorDescription!,
      );
      return errorWidget ??
          Stack(
            children: [
              if (chewieController.isFullScreen) _buildTopBar(context),
              const Center(
                child: Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 42,
                ),
              )
            ],
          );
    }
    return MouseRegion(
      onHover: (_) {
        _cancelAndRestartTimer();
      },
      child: GestureDetector(
        onTap: () => _cancelAndRestartTimer(),
        child: AbsorbPointer(
          absorbing: notifier.hideStuff,
          child: Stack(
            children: [
              if (_displayBufferingIndicator) _buildCenterLoading(context) else _buildHitArea(),
              if (widget.showTopBar || chewieController.isFullScreen) _buildTopBar(context),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  if (_subtitleOn)
                    Transform.translate(
                      offset: Offset(
                        0.0,
                        notifier.hideStuff ? barHeight * 0.8 : 0.0,
                      ),
                      child: _buildSubtitles(context, chewieController.subtitle!),
                    ),
                  SafeArea(bottom: chewieController.isFullScreen && !kIsWeb && Platform.isIOS,child: _buildBottomBar(context),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///居中的加载框
  Widget _buildCenterLoading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: context.theme.primaryColor,
      ),
    );
  }

  ///创建顶部返回按钮
  Widget _buildTopBar(BuildContext context) {
    return AnimatedOpacity(
      opacity: notifier.hideStuff && !kIsWeb ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: SafeArea(
        top: true,
        child: Container(
          height: 48,
          decoration: const BoxDecoration(color: Color(0x3b000000)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Expanded(
                  child: Text(
                widget.title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _dispose() {
    controller.removeListener(_updateState);
    _hideTimer?.cancel();
    _initTimer?.cancel();
    _showAfterExpandCollapseTimer?.cancel();
  }

  @override
  void didChangeDependencies() {
    final oldController = _chewieController;
    _chewieController = ChewieController.of(context);
    controller = chewieController.videoPlayerController;

    if (oldController != chewieController) {
      _dispose();
      _initialize();
    }
    super.didChangeDependencies();
  }

  Widget _buildSubtitles(BuildContext context, Subtitles subtitles) {
    if (!_subtitleOn) {
      return const SizedBox();
    }
    final currentSubtitle = subtitles.getByPosition(_subtitlesPosition);
    if (currentSubtitle.isEmpty) {
      return const SizedBox();
    }

    if (chewieController.subtitleBuilder != null) {
      return chewieController.subtitleBuilder!(
        context,
        currentSubtitle.first!.text,
      );
    }

    return Padding(
      padding: EdgeInsets.all(marginSize),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0x96000000),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          currentSubtitle.first!.text.toString(),
          style: const TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  AnimatedOpacity _buildBottomBar(
    BuildContext context,
  ) {
    final iconColor = Theme.of(context).textTheme.labelLarge!.color;
    final height = widget.showPosition ? barHeight : barHeight - 20;
    return AnimatedOpacity(
      opacity: notifier.hideStuff ? 0.0 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: SizedBox(
        height: height,
        child: SafeArea(
          bottom: chewieController.isFullScreen,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            verticalDirection: VerticalDirection.up,
            children: [
              Flexible(
                child: Row(
                  children: <Widget>[
                    if (widget.showPauseButton) _buildPlayPause(controller),
                    if (widget.showPosition) _buildPosition(iconColor),
                    const SizedBox(
                      width: 5,
                    ),
                    _buildProgressBar(),
                    const SizedBox(
                      width: 5,
                    ),
                    if (widget.showPosition) _buildDuration(iconColor),
                    const SizedBox(
                      width: 10,
                    ),
                    if (widget.showMuting) _buildMuteButton(controller),
                    const SizedBox(
                      width: 5,
                    ),
                    if (chewieController.allowFullScreen) _buildExpandButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandButton() {
    return Hero(
      tag: "expandButton",
      child: GestureDetector(
        onTap: _onExpandCollapse,
        child: AnimatedOpacity(
          opacity: notifier.hideStuff ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Container(
            height: barHeight,
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Center(
              // child: AppAsset.assets.imagesIconVideoFullscreen.toAssetImageWidget(width: 17,height: 14),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHitArea() {
    final bool isFinished = _latestValue.position >= _latestValue.duration;
    final bool showPlayButton = widget.showPlayButton && !_dragging && !notifier.hideStuff;

    return GestureDetector(
      onTap: () {
        if (_latestValue.isPlaying) {
          if (_displayTapped) {
            setState(() {
              notifier.hideStuff = true;
            });
          } else {
            _cancelAndRestartTimer();
          }
        } else {
          _playPause();

          setState(() {
            notifier.hideStuff = true;
          });
        }
      },
      child: Center(child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBackProgress(showPlayButton),
          const SizedBox(
            width: 15,
          ),
          CenterPlayButton(
            backgroundColor: Colors.white.withOpacity(0.2),
            iconColor: Colors.white,
            size: 52,
            isFinished: isFinished,
            isPlaying: controller.value.isPlaying,
            show: showPlayButton,
            onPressed: _playPause,
          ),
          const SizedBox(
            width: 15,
          ),
          _buildForwardProgress(showPlayButton),
        ],
      ),),
    );
  }

  Widget _buildBackProgress(bool show) {
    return AnimatedOpacity(
      opacity: show ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      // child: IconButton(
      //   onPressed: () {
      //     controller.seekTo(Duration(milliseconds: controller.value.position.inMilliseconds - 10000));
      //   },
      //   icon: AppAsset.assets.imagesIconVideoProgressBack.toAssetImageWidget(width: 36, height: 36),
      // ),
    );
  }

  Widget _buildForwardProgress(bool show) {
    return AnimatedOpacity(
      opacity: show ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      // child: IconButton(
      //   onPressed: () {
      //     controller.seekTo(Duration(milliseconds: controller.value.position.inMilliseconds + 10000));
      //   },
      //   icon: AppAsset.assets.imagesIconVideoProgressForward.toAssetImageWidget(width: 36, height: 36),
      // ),
    );
  }

  Future<void> _onSpeedButtonTap(double chosenSpeed) async {
    controller.setPlaybackSpeed(chosenSpeed);
    if (_latestValue.isPlaying) {
      _startHideTimer();
    }
  }

  GestureDetector _buildMuteButton(
    VideoPlayerController controller,
  ) {
    return GestureDetector(
      onTap: () {
        _cancelAndRestartTimer();

        if (_latestValue.volume == 0) {
          controller.setVolume(_latestVolume ?? 0.5);
        } else {
          _latestVolume = controller.value.volume;
          controller.setVolume(0.0);
        }
      },
      child: AnimatedOpacity(
        opacity: notifier.hideStuff ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: SizedBox(
          height: 13,
          width: 16,
          // child: _latestValue.volume > 0 ? AppAsset.assets.imagesIconVideoVolumeUp.toAssetImageWidget(width: 15,height: 11)
          // :AppAsset.assets.imagesIconVideoVolumeOff.toAssetImageWidget(width: 15,height: 11),
        ),
      ),
    );
  }

  GestureDetector _buildPlayPause(VideoPlayerController controller) {
    return GestureDetector(
      onTap: _playPause,
      child: Container(
        height: barHeight,
        color: Colors.transparent,
        margin: const EdgeInsets.only(left: 8.0, right: 4.0),
        child: AnimatedPlayPause(
          playing: controller.value.isPlaying,
          size: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSpeedItem(BuildContext context, String speed, String selected) {
    if (speed == selected) {
      return Center(
        child: Text(
          speed,
          style: TextStyle(fontSize: 14.0, color: context.theme.primaryColor),
        ),
      );
    }
    return Center(
      child: Text(speed),
    );
  }

  ///速度
  Widget _buildSpeed(BuildContext context, VideoPlayerController controller) {
    final menuItems = <PopupMenuItem>[];
    final speeds = chewieController.playbackSpeeds;
    final double menuHeight = 15 + (26 * speeds.length).toDouble();
    for (var item in speeds) {
      menuItems.add(PopupMenuItem(
        height: 26,
        value: item,
        child: _buildSpeedItem(context, "${item}x", "${controller.value.playbackSpeed}x"),
      ));
    }
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 40, maxWidth: 70),
      offset: Offset(0, -menuHeight),
      child: Center(
        child: Text(
          "${controller.value.playbackSpeed}x",
          style: const TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      ),
      onOpened: () {
        _hideTimer?.cancel();
      },
      onSelected: (item) {
        _onSpeedButtonTap(item);
      },
      onCanceled: () {
        _onSpeedButtonTap(controller.value.playbackSpeed);
      },
      itemBuilder: (BuildContext context) {
        return menuItems;
      },
    );
  }

  Widget _buildPosition(Color? iconColor) {
    final position = _latestValue.position;
    return Text(
      formatDuration(position),
      style: const TextStyle(
        fontSize: 12.0,
        color: Colors.white,
      ),
    );
  }

  Widget _buildDuration(Color? iconColor) {
    final duration = _latestValue.duration;
    return Text(
      formatDuration(duration),
      style: const TextStyle(
        fontSize: 12.0,
        color: Colors.white,
      ),
    );
  }

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();
    _startHideTimer();

    setState(() {
      notifier.hideStuff = false;
      _displayTapped = true;
    });
  }

  Future<void> _initialize() async {
    _subtitleOn = chewieController.subtitle?.isNotEmpty ?? false;
    controller.addListener(_updateState);

    _updateState();

    if (controller.value.isPlaying || chewieController.autoPlay) {
      _startHideTimer();
    }

    if (chewieController.showControlsOnInitialize) {
      _initTimer = Timer(const Duration(milliseconds: 200), () {
        setState(() {
          notifier.hideStuff = false;
        });
      });
    }
  }

  void _onExpandCollapse() {
    setState(() {
      notifier.hideStuff = true;
    });

    chewieController.toggleFullScreen();

    _showAfterExpandCollapseTimer = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _cancelAndRestartTimer();
      });
    });
  }

  void _playPause() {
    if (controller.value.isPlaying) {
      setState(() {
        notifier.hideStuff = false;
      });

      _hideTimer?.cancel();
      controller.pause();
    } else {
      _cancelAndRestartTimer();

      if (!controller.value.isInitialized) {
        controller.initialize().then((_) {
          //[VideoPlayerController.play] If the video is at the end, this method starts playing from the beginning
          controller.play();
        });
      } else {
        //[VideoPlayerController.play] If the video is at the end, this method starts playing from the beginning
        controller.play();
      }
    }
  }

  void _startHideTimer() {
    final hideControlsTimer =
        chewieController.hideControlsTimer.isNegative ? ChewieController.defaultHideControlsTimer : chewieController.hideControlsTimer;
    _hideTimer = Timer(hideControlsTimer, () {
      setState(() {
        notifier.hideStuff = true;
      });
    });
  }

  void _bufferingTimerTimeout() {
    _displayBufferingIndicator = true;
    if (mounted) {
      setState(() {});
    }
  }

  void _updateState() {
    if (!mounted) return;

    // display the progress bar indicator only after the buffering delay if it has been set
    if (chewieController.progressIndicatorDelay != null) {
      if (controller.value.isBuffering) {
        _bufferingDisplayTimer ??= Timer(
          chewieController.progressIndicatorDelay!,
          _bufferingTimerTimeout,
        );
      } else {
        _bufferingDisplayTimer?.cancel();
        _bufferingDisplayTimer = null;
        _displayBufferingIndicator = false;
      }
    } else {
      _displayBufferingIndicator = controller.value.isBuffering;
    }

    setState(() {
      _latestValue = controller.value;
      _subtitlesPosition = controller.value.position;
    });
  }

  Widget _buildProgressBar() {
    return Expanded(
      child: VideoProgressBar(
        controller,
        barHeight: 3,
        handleHeight: 2,
        drawShadow: true,
        onDragStart: () {
          setState(() {
            _dragging = true;
          });

          _hideTimer?.cancel();
        },
        onDragUpdate: () {
          _hideTimer?.cancel();
        },
        onDragEnd: () {
          setState(() {
            _dragging = false;
          });

          _startHideTimer();
        },
        colors: chewieController.materialProgressColors ??
            ChewieProgressColors(
              playedColor: Theme.of(context).colorScheme.secondary,
              handleColor: Theme.of(context).colorScheme.secondary,
              bufferedColor: Theme.of(context).colorScheme.background.withOpacity(0.5),
              backgroundColor: Theme.of(context).disabledColor.withOpacity(.5),
            ),
      ),
    );
  }
}
