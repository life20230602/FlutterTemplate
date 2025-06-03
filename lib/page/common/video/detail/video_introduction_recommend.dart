import 'package:flutter/material.dart';
import 'package:flutter_se/page/common/video/detail/recommend_video_item_widget.dart';

import '../../../../bean/video_list_item_bean.dart';
import '../widget/app_video_item_widget.dart';


///视频简介中的推荐视频
class VideoRecommendWidget extends StatelessWidget {
  const VideoRecommendWidget(this.suggestionList, {super.key,this.onVideoItemClick});

  final List<VideoListElement> suggestionList;
  final OnVideoItemClick? onVideoItemClick;

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    for (var value in suggestionList) {
      widgets.add(_buildItem(value));
      widgets.add(const SizedBox(height: 10,));
    }
    return Column(children: widgets,);
  }

  ///推荐视频item
  Widget _buildItem(VideoListElement item) {
    return RecommendVideoItemWidget(item,onVideoItemClick: onVideoItemClick,);
  }
}
