import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/base/logic/app_base_refresh_logic.dart';
import 'package:flutter_se/base/logic/app_refresh_helper_mixin.dart';

import '../../../bean/post_list_bean.dart';
import '../entity/post_list_element_ext.dart';

///社区-标签-tab 列表
class CommunityTagChildLogic extends AppGetXBaseRefreshLogic with AppRefreshHelper<PostListElementExt> {

  @override
  void onLoadData(bool firstLoad, int page, bool isLoadMore) {
    itemList.add(PostListElementExt.copyWith(
        PostListElement.fromJson({
          "id": 1077983,
          "post_name": "圈里模特姐妹，单男有偿，夫妻勿扰",
          "price": "1",
          "permission": 2,
          "cover_image": "https://video-photo.121382.com/20240323/3a6badedac9a476ab2250648b2bb0469.jpg?auth_key=1717051299-655c48e66b1847db854c0b285d623796-0-df1542fae0d6e52a6e158cc6be121f4f",
          "created_at": 1710767154,
          "view_count_num": 22157,
          "favorite_count": 5887,
          "like_count": 10617,
          "comment_count": 0,
          "download_count": 0,
          "post_content": "\n<img src=\"attach_url:0\" style=\"\">",
          "lite_content": "",
          "is_horizontal": 0,
          "sort": 0,
          "blogger_id": 169742839445,
          "blogger_name": "喜悦墨镜",
          "blogger_avatar": "https://video-photo.121382.com/20240404/5a1cfa7c7b5540dc85dfcdd09c14cd16.png?auth_key=1717051299-e2b0860bbbad42b181b0cab919c25725-0-576e8f3d8fca1737f52475086741d1f9",
          "post_type_id": 705,
          "post_type_name": "AI脱衣",
          "is_like": 0,
          "is_fav": 0,
          "is_follow": 0,
          "is_essence": 0,
          "is_top": 0,
          "is_buy": false,
          "collection_id": 0,
          "collection_name": "",
          "tag_name": "",
          "post_videos": [{
            "vid": 551186,
            "video_url": "",
            "horizontal_cover": "https://video-photo.121382.com/20240323/a0a244f970954cb68873ac368c2e7be6.jpg?auth_key=1717051299-2bcc01bd7ed04244a002a8b63482c95b-0-b77d811b48d164a1286900a53279bb2e",
            "vertical_cover": "https://video-photo.121382.com/20240323/a0a244f970954cb68873ac368c2e7be6.jpg?auth_key=1717051299-8ba5f65324644d48b1d67998321cbfe1-0-512f61b40befb42ac2d50625f92c0ec0",
            "play_time": 24,
            "sale_price": "0",
            "title": "圈里模特姐妹，单男有偿，夫妻勿扰",
            "is_horizontal": 0
          }],
          "href": "",
          "notify_time": 1712671539,
          "view_count": "2.2万",
          "post_type": 0
        })
    ));
    showSuccess();
  }
}
