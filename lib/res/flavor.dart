import 'package:flutter/cupertino.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/res/app_strings.dart';
import 'package:flutter_se/res/assets_impl/app_flavor_green_asset_impl.dart';
import 'package:flutter_se/res/strings_impl/app_flavor_muyin_string_impl.dart';

import 'impl/app_green_theme_impl.dart';
import 'themes.dart';


///渠道资源管理
class Flavors {
  Flavors._internal();

  factory Flavors() => _instance;

  static final Flavors _instance = Flavors._internal();

  AppTheme? _appTheme;

  AppAsset? _appAsset;

  AppString? _appString;

  AppTheme getAppTheme(BuildContext context) =>
      _appTheme ?? (_appTheme = _createAppTheme(context));

  AppAsset getAppAsset() => _appAsset ?? (_appAsset = _createAppAsset());

  AppString getAppString() => _appString ?? (_appString = _createAppString());

  AppTheme _createAppTheme(BuildContext context) {
    final flavor = const String.fromEnvironment("flavor");
    return AppGreenThemeImpl(context: context);
  }

  AppAsset _createAppAsset() {
    final flavor = const String.fromEnvironment("flavor");
    return AppFlavorGreenAssetImpl();
  }

  AppString _createAppString() {
    final flavor = const String.fromEnvironment("flavor");
    return AppFlavorMuyinStringImpl();
  }
}
