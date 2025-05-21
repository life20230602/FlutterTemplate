import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:get/get.dart';

import 'entity/menu_entity.dart';
import 'input_exchange/input_exchange_code_page.dart';
import 'invite/invite_page.dart';
import 'official/official_page.dart';

///我的
class MineLogic extends AppGetXBaseLogic {

  //菜单项
  final menuList = <MenuEntity>[];
  //最底部的菜单项
  final bottomMenuList = <MenuEntity>[];

  @override
  void onLoad() {
    _initMenu();
    showSuccess();
  }


  ///复制用户 Id
  void copyUserId() {

  }

  ///初始化菜单
  void _initMenu() {
    menuList.add(MenuEntity(AppAsset.assets.imagesIconContactCustomer, "联系客服", (){}));
    menuList.add(MenuEntity(AppAsset.assets.imagesIconMyBuy, "我的购买", (){}));
    menuList.add(MenuEntity(AppAsset.assets.imagesIconMyFollow, "我的关注", (){}));
    menuList.add(MenuEntity(AppAsset.assets.imagesIconMyCollect, "我的收藏", (){}));

    bottomMenuList.add(MenuEntity(AppAsset.assets.imagesIconContactCustomer, "AI脱衣", (){}));
    bottomMenuList.add(MenuEntity(AppAsset.assets.imagesIconMyBuy, "官方群", (){
      Get.to(OfficialPage());
    }));
    bottomMenuList.add(MenuEntity(AppAsset.assets.imagesIconMyFollow, "原创入住", (){}));
    bottomMenuList.add(MenuEntity(AppAsset.assets.imagesIconMyCollect, "商务合作", (){}));
    bottomMenuList.add(MenuEntity(AppAsset.assets.imagesIconMyCollect, "账号凭证", (){}));
    bottomMenuList.add(MenuEntity(AppAsset.assets.imagesIconMyCollect, "常见问题", (){}));
    bottomMenuList.add(MenuEntity(AppAsset.assets.imagesIconMyCollect, "填写兑换码", (){
      Get.to(InputExchangeCodePage());
    }));
    bottomMenuList.add(MenuEntity(AppAsset.assets.imagesIconMyCollect, "应用推荐", (){

    }));
  }
}
