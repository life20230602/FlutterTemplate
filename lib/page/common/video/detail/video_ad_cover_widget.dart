import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../bean/video_list_item_bean.dart';
import '../../../../route/route_utils.dart';
import '../../../../widget/component/ad_common_widget.dart';

typedef OnAdCompleteCallback = void Function();

class VideoAdCoverWidget extends StatefulWidget {
  const VideoAdCoverWidget({
    super.key,
    required this.videoItem,
    required this.onAdComplete,
  });

  final VideoListElement videoItem;
  final OnAdCompleteCallback onAdComplete;

  @override
  State createState() => _VideoAdCoverWidgetState();
}

class _VideoAdCoverWidgetState extends State<VideoAdCoverWidget> {
  late Timer _timer;
  int _remainingTime = 5;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didUpdateWidget(covariant VideoAdCoverWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _remainingTime = 5;
    _timer.cancel();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          widget.onAdComplete();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AdBannerWidget(),
        Positioned(
          top: 10,
          right: 10,
          child: _buildSkipButton(),
        ),
      ],
    );
  }

  Widget _buildSkipButton() {
    return GestureDetector(
      onTap: () {
        RouteUtils.toVip();
      },
      child: Container(
        height: 28,
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          '${_remainingTime}S 会员关闭广告',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
