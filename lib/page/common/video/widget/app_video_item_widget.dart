import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/utils/int_convert_utils.dart';

import '../../../../bean/video_list_item_bean.dart';
import '../../../../res/app_asset.dart';

typedef OnVideoItemClick = void Function(VideoListElement item);

///统一的视频item样式
class AppVideoItemWidget extends StatelessWidget {
  const AppVideoItemWidget(
    this.item, {
    super.key,
    this.onVideoItemClick,
    this.aspectRatio,
  });

  final VideoListElement item;
  final OnVideoItemClick? onVideoItemClick;
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onVideoItemClick != null) {
          onVideoItemClick!(item);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(item),
          const SizedBox(height: 2),
          Container(
            padding: const EdgeInsets.fromLTRB(3, 0, 3, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(item),
                if (!item.adv)
                  _buildBottomDescInfo()
                else
                  const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///创建封面
  Widget _buildImage(VideoListElement item) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? 173 / 110,
      child: Stack(
        fit: StackFit.expand,
        children: [
          item.horizontalCover.toEncryptNetworkImageWidget(radius: 6),
          if (!item.adv)
            Align(alignment: Alignment.bottomLeft, child: _buildDescInfo()),
          Align(
            alignment: Alignment.topRight,
            child: item.toPermissionWidget(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///视频标题
  Widget _buildTitle(VideoListElement item) {
    return SizedBox(
      height: 40,
      child: Text(
        item.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }

  ///视频描述信息
  Widget _buildDescInfo() {
    return Container(
      height: 23,
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(6),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black, Colors.black.withOpacity(0.1)],
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "${item.clickCount.toUnit()}播放",
              style: const TextStyle(fontSize: 10),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                item.videoLength.toHms(),
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///评论和更新时间
  Widget _buildBottomDescInfo() {
    return SizedBox(
      height: 15,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              item.createdAt.toFormatTimeByRecent(),
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "评论 ${item.commentCount.toUnit()}",
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

abstract class _PermissionWidget extends StatelessWidget {
  const _PermissionWidget(this.text, {this.borderRadius});

  final String text;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: colors(context),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 11, color: textColor(context)),
      ),
    );
  }

  List<Color> colors(BuildContext context);

  Color textColor(BuildContext context) {
    return Colors.white;
  }
}

//VIP 权限样式
class _PermissionVipWidget extends _PermissionWidget {
  const _PermissionVipWidget(super.text, {super.borderRadius});

  @override
  List<Color> colors(BuildContext context) {
    return context.appTheme.videoPermissionVipBgColor;
  }

  @override
  Color textColor(BuildContext context) =>
      context.appTheme.videoPermissionVipTextColor;
}

//金币 权限样式
class _PermissionCoinWidget extends _PermissionWidget {
  const _PermissionCoinWidget(super.text, {super.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: colors(context),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 9, color: textColor(context)),
      ),
    );
  }

  @override
  List<Color> colors(BuildContext context) {
    return context.appTheme.videoPermissionCoinBgColor;
  }
}

//免费 权限样式
class _PermissionFreeWidget extends _PermissionWidget {
  const _PermissionFreeWidget(super.text, {super.borderRadius});

  @override
  List<Color> colors(BuildContext context) {
    return context.appTheme.videoPermissionFreeBgColor;
  }

  @override
  Color textColor(BuildContext context) {
    return context.appTheme.videoPermissionFreeTextColor;
  }
}

//广告 样式
class _PermissionAdWidget extends _PermissionWidget {
  const _PermissionAdWidget(super.text, {super.borderRadius});

  @override
  List<Color> colors(BuildContext context) {
    return [const Color(0xFFFF68F9), const Color(0xFF5C3CDD)];
  }
}

extension VideoListElementExt on VideoListElement {
  ///视频权限
  Widget toPermissionWidget({BorderRadius? borderRadius}) {
    Widget? widget;
    if (permissionType == 1) {
      widget = _PermissionVipWidget("VIP", borderRadius: borderRadius);
    } else if (permissionType == 2) {
      widget = _PermissionFreeWidget("免费", borderRadius: borderRadius);
    } else if (permissionType == 3) {
      var stringAsFixed = Decimal.parse(salePrice).toStringAsFixed(1);
      if (int.parse(stringAsFixed.substring(stringAsFixed.indexOf(".") + 1)) ==
          0) {
        stringAsFixed = stringAsFixed.substring(0, stringAsFixed.indexOf("."));
      }
      widget = _PermissionCoinWidget(stringAsFixed, borderRadius: borderRadius);
    } else if (adv) {
      widget = _PermissionAdWidget("广告", borderRadius: borderRadius);
    } else {
      widget = Container();
    }
    return widget;
  }
}
