import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/common/video/video_list_page.dart';
import 'package:flutter_se/page/mu_yin/mu_yin_logic.dart';
import 'package:flutter_se/page/zi_xiao/zi_xiao_child_logic.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/component/app_back_button_widget.dart';
import 'package:flutter_se/widget/component/search_widget.dart';
import 'package:flutter_se/widget/widget_utils.dart';

import '../../widget/ticker_provider.dart';
import '../common/video/video_list_logic.dart';
import '../mu_yin/category/mu_yin_category_page.dart';
import 'zi_xiao_logic.dart';

///子笑
class ZiXiaoChildPage extends VideoListPage {
  ZiXiaoChildPage({super.key});

  @override
  VideoListLogic createController() => ZiXiaoChildLogic();
}
