import 'package:flutter_se/res/flavor.dart';


///assets 资产管理
abstract class AppAsset {

  static AppAsset get assets => Flavors().getAppAsset();

  String get imagesMainBottomIcon1Default;

  String get imagesMainBottomIcon2Default;

  String get imagesMainBottomIcon3Default;

  String get imagesMainBottomIcon4Default;

  String get imagesMainBottomIcon5Default;
}
