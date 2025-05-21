import 'package:flutter_se/res/flavor.dart';

///assets 资产管理
abstract class AppAsset {
  static AppAsset get assets => Flavors().getAppAsset();

  String get imagesMainBottomIcon1Default;

  String get imagesMainBottomIcon2Default;

  String get imagesMainBottomIcon3Default;

  String get imagesMainBottomIcon4Default;

  String get imagesMainBottomIcon5Default;

  String get imagesIconMuYinTitleMenu;

  String get imagesIconSearch;

  String get imagesIconVideoListShowTypeGrid;

  String get imagesIconVideoListShowTypeList;

  String get imagesIconSetting;

  String get imagesIconNotification;

  String get imagesIconCopy;
  String get imagesIconHistory;
  String get imagesIconContactCustomer;
  String get imagesIconMyBuy;
  String get imagesIconMyCollect;
  String get imagesIconMyFollow;
  String get imagesIconInviteBg;
  String get imagesIconInviteArrow;
  String get imagesIconInviteBuZhou;
  String get imagesIconArrowRight;
  String get imagesIconMineAmount;
  String get imagesIconMineLunPan;
  String get imagesIconMineShare;
}
