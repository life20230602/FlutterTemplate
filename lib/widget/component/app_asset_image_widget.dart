import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_svg/svg.dart';

///app 本地图片加载
class AppAssetImageWidget extends StatelessWidget {
  const AppAssetImageWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius = 0,
    this.color,
    this.fit = BoxFit.contain,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final double radius;
  final Color? color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return radius > 0 ? _buildRectImage() : _buildImage();
  }

  ///圆角本地图片
  Widget _buildRectImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: imageUrl.endsWith(".svg") ? _buildSvgImage() : _buildImage(),
    );
  }

  ///加载本地图片
  Widget _buildImage() {
    if (imageUrl.endsWith(".svg")) {
      return _buildSvgImage();
    }
    return Image.asset(
      imageUrl,
      height: height ?? 30,
      color: color,
      width: width ?? 80,
      gaplessPlayback: false,
      fit: fit,
    );
  }

  ///svg加载
  Widget _buildSvgImage() {
    return SvgPicture.asset(imageUrl, height: height, width: width, fit: fit,color: color,);
  }
}
