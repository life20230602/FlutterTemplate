import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/page/zi_xiao/entity/item_entity.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:get/get.dart';

///子笑
class ZiXiaoLogic extends AppGetXBaseLogic {
  final itemEntityListObs = <ItemEntity>[].obs;

  @override
  void onLoad() {
    itemEntityListObs.add(
      ItemEntity(
        image: AppAsset.assets.imagesIconZixiaoXiaoXue,
        title: "初入小学",
        button: "免费观影",
        desc: "7-12岁",
        desc2: "破处见红真实记录",
          permission: true
      ),
    );
    itemEntityListObs.add(
      ItemEntity(
        image: AppAsset.assets.imagesIconZixiaoXiaoXue,
        title: "初入中学",
        button: "免费观影",
        desc: "12-15岁",
        desc2: "“她”还只是个孩子！",
          permission: false
      ),
    );
    itemEntityListObs.add(
      ItemEntity(
        image: AppAsset.assets.imagesIconZixiaoXiaoXue,
        title: "经历高中",
        button: "立即解锁",
        desc: "15-17岁",
        desc2: "粉色给了同桌！",
          permission: false
      ),
    );
    itemEntityListObs.add(
      ItemEntity(
        image: AppAsset.assets.imagesIconZixiaoXiaoXue,
        title: "考入大学",
        button: "立即解锁",
        desc: "15-17岁",
        desc2: "阴唇由粉变黑的始末！",
          permission: false
      ),
    );
    itemEntityListObs.add(
      ItemEntity(
        image: AppAsset.assets.imagesIconZixiaoXiaoXue,
        title: "留学深造",
        button: "立即解锁",
        desc: "20-24岁",
        desc2: "子宫逐渐适做了黑屌！",
          permission: false
      ),
    );
    itemEntityListObs.add(
      ItemEntity(
        image: AppAsset.assets.imagesIconZixiaoXiaoXue,
        title: "全球封禁强奸",
        button: "立即解锁",
        desc: "",
        desc2: "强奸N号房，缅北封杀真相，血腥！",
        permission: true
      ),
    );
    showSuccess();
  }
}
