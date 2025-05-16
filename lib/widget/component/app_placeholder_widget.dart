import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_asset_image_widget.dart';

/// app 暂位图
class AppPlaceHolderWidget extends StatelessWidget {
  const AppPlaceHolderWidget({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    // return AppAssetImageWidget(
    //   width: width,
    //   height: height,
    //   imageUrl: Assets.imagesIconPlaceholder,
    // );
    return CircularProgressIndicator(
      strokeWidth: 2,
      color: context.theme.primaryColor,
    );
  }
}
