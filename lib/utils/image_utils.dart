import 'package:flutter/material.dart';
import 'package:flutter_se/widget/component/app_asset_image_widget.dart';
import 'package:flutter_se/widget/component/app_network_image_widget.dart';
import 'package:flutter_se/widget/component/app_placeholder_widget.dart';


/// 图片加载工具类
class ImageUtils {
  /// 加载本地资源图片SvgPicture.asset
  static Widget loadAssetImage(
    String assetsUrl, {
    double? width,
    double? height,
    double radius = 0,
    Color? color,
    BoxFit fit = BoxFit.contain,
  }) {
    return AppAssetImageWidget(
      imageUrl: assetsUrl,
      width: width,
      height: height,
      color: color,
      radius: radius,
      fit: fit,
    );
  }

  static Widget buildDefaultCoverWidget({double? width, double? height}) {
    return AppPlaceHolderWidget(width: width, height: height);
  }

  /// 加载网络图片, placeholder:占位图和加载失败时显示同一张图片
  static Widget loadNetworkImage(
    String imageUrl, {
    String placeholder = "none",
    double? width,
    double? coverWidth,
    double? height,
    double? coverHeight,
    double radius = 0,
    bool decrypt = false,
    BoxFit fit = BoxFit.cover,
  }) {
    return AppNetworkImageWidget(
      imageUrl: imageUrl,
      placeholder: placeholder,
      width: width,
      height: height,
      coverWidth: coverWidth,
      coverHeight: coverHeight,
      radius: radius,
      decrypt: decrypt,
      fit: fit,
    );
  }

  ///加载加密的图片
  static Widget loadEncryptImage(
    String url, {
    BoxFit? fit,
    double radius = 0,
    double? width,
    double? height,
    double? coverWidth,
    double? coverHeight,
  }) {
    return loadNetworkImage(
      url,
      fit: fit ?? BoxFit.cover,
      radius: radius,
      decrypt: true,
      width: width,
      height: height,
      coverWidth: coverWidth,
      coverHeight: coverHeight,
    );
  }
}

extension ImageLoadExt on String {
  ///字符串快速转网络图片加载widget
  Widget toNetworkImageWidget({
    double? width,
    double? height,
    BoxFit? fit,
    double radius = 0,
  }) {
    return ImageUtils.loadNetworkImage(
      this,
      width: width,
      height: height,
      radius: radius,
    );
  }

  ///图片地址快速加载加密的网络图片
  Widget toEncryptNetworkImageWidget({
    BoxFit? fit,
    double radius = 0,
    double? width,
    double? height,
    double? coverWidth,
    double? coverHeight,
  }) {
    return ImageUtils.loadEncryptImage(
      this,
      fit: fit,
      radius: radius,
      coverHeight: coverHeight,
      coverWidth: coverWidth,
      width: width,
      height: height,
    );
  }

  ///字符串转 assets 图片加载
  Widget toAssetImageWidget({
    double? width,
    double? height,
    double? size,
    Color? color,
    BoxFit fit = BoxFit.contain,
    double radius = 0,
  }) {
    return ImageUtils.loadAssetImage(
      this,
      width: size ?? width,
      height: size ?? height,
      fit: fit,
      color: color,
      radius: radius,
    );
  }

  ///字符串加载图片
  Widget toImageWidget({BoxFit fit = BoxFit.contain, double radius = 0}) {
    if (startsWith("http")) {
      return toNetworkImageWidget(fit: fit, radius: radius);
    }
    return toAssetImageWidget(fit: fit, radius: radius);
  }
}
