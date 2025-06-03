import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';

import '../../res/app_asset.dart';
import 'entity/item_entity.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.entity, this.onTap});

  final ItemEntity entity;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImage(context),
        const SizedBox(height: 2),
        Text(entity.title, style: TextStyle(fontSize: 13, color: Colors.white)),
        Text(entity.desc, style: TextStyle(fontSize: 11, color: Colors.white)),
        Text(
          entity.desc2,
          style: TextStyle(fontSize: 11, color: context.appTheme.primary),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(top: 7),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              color:
                  entity.permission
                      ? Color(0xFFF7C900)
                      : context.appTheme.primary,
              borderRadius: BorderRadius.circular(55),
            ),
            child: Text(
              entity.button,
              style: TextStyle(fontSize: 11, color: Colors.black),
              strutStyle: StrutStyle(forceStrutHeight: true),
            ),
          ),
        ),
      ],
    );
  }

  ///图片
  Widget _buildImage(BuildContext context) {
    return Container(
      width: 102,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      height: 102,
      child: Stack(
        children: [
          AppAsset.assets.imagesIconZixiaoXiaoXue.toAssetImageWidget(size: 102),
          _buildShadow(context),
        ],
      ),
    );
  }

  ///阴影
  Widget _buildShadow(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(context.appTheme.primary, BlendMode.srcOut),
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
          tileMode: TileMode.decal,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
