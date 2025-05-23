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
  String get imagesIconMsgInteractive;
  String get imagesIconMsgCustomer;
  String get imagesIconMsgSystem;
  String get imagesIconTakePhoto;
  String get imagesIconEdit;
  String get imagesIconTrash;
  String get imagesIconClose;
  String get imagesIconMineAi;
  String get imagesIconMineAccountCredentials;
  String get imagesIconMineApps;
  String get imagesIconMineBusiness;
  String get imagesIconMineGroup;
  String get imagesIconMineInputInvite;
  String get imagesIconMineOriginalEntry;
  String get imagesIconMineQuestion;
}
