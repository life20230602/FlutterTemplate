import 'package:flutter/material.dart';
import 'package:flutter_se/res/themes.dart';

import 'flavor.dart';

extension BuildContextExt on BuildContext {
  AppTheme get appTheme => Flavors().getAppTheme(this);
}
