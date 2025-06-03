import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../../bean/video_detail_bean.dart';
import '../../../../bean/video_list_item_bean.dart';
import '../../mixin/player_record_mixin_controller.dart';

///视频详情
class VideoDetailLogic extends AppGetXBaseLogic with PlayerRecordMixinController{
  VideoDetailLogic({this.vid = 0});

  final int vid;

  ///视频播放数据
  Rxn<VideoListElement> videoInfoObs = Rxn();

  ///评论数量
  final commentCountObs = 0.obs;

  ///详情数据
  Rxn<VideoDetailBean> videoDetailInfoObs = Rxn();

  @override
  void onLoad() {
    loadWithVid(vid,false);
  }

  void loadWithVid(int vid,bool loading) {
    // var videoDetail = client.getVideoDetail({"vid": vid}, cancelToken);
    // if(loading){
    //   videoDetail = bindLoading(videoDetail);
    // }
    // videoDetail.then((value){
    //   videoDetailInfoObs.value = value;
    //   videoInfoObs.value = value.video;
    //   commentCountObs.value = videoInfoObs.value!.commentCount;
    //   showSuccess();
    // }).catchException(this);
  }

  ///播放指定视频
  void playVideo(VideoListElement item) {
    loadWithVid(item.id,true);
  }
}
