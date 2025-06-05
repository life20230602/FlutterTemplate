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
  String get imagesIconLikeLarge;
  String get imagesIconComment;
  String get imagesIconFollowUser;
  String get imagesIconShare;
  String get imagesIconViewCount;
  String get imagesIconCommentCount;
  String get imagesIconLike;
  String get imagesIconLikeDefault;
  String get imagesIconAiStrip;
  String get imagesIconAiFaceSwap;
  String get imagesIconAiVideoFaceSwap;
  String get imagesIconAiDiyFaceSwap;
  String get imagesIconAiCenter;
  String get imagesIconAiVideoFaceSwapActive;
  String get imagesIconAiCenterActive;
  String get imagesIconCoin;
  String get imagesIconRadio;
  String get imagesIconRadioActive;
  String get imagesIconWechat;
  String get imagesIconAlipay;
  String get imagesIconImageHolder;
  String get imagesIconAiStripSource;
  String get imagesIconAiStripDest;
  String get imagesIconVipChargeBanner;
  String get imagesIconZixiaoCoverTop;
  String get imagesIconZixiaoXiaoXue;
  String get imagesIconCommentSend;
  String get imagesIconAiVipBanner;
  String get imagesIconLikeHand;
}
