import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/widget/app_divider_widget.dart';
import 'package:get/get.dart';

import '../../../res/app_asset.dart';
import '../../../utils/image_utils.dart';
import '../../../utils/int_convert_utils.dart';
import '../../../widget/mix_icon_text.dart';
import '../bloghost_page.dart';
import '../entity/post_list_element_ext.dart';

typedef OnBlogItemClick = void Function(PostListElementExt item);
typedef OnLikeClick = void Function(PostListElementExt item);
typedef OnFollowClick = void Function(PostListElementExt item);

///统一的社区item样式
class CommunityItemWidget extends StatelessWidget {
  const CommunityItemWidget(
    this.item, {
    super.key,
    this.onFollowClick,
    this.onLikeClick,
  });

  final PostListElementExt item;
  final OnLikeClick? onLikeClick;
  final OnFollowClick? onFollowClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topWidget(context),
          _midWidget(),
          _titleWidget(context),
          const SizedBox(height: 10,),
          _bottomOther(context),
          const SizedBox(height: 10,),
          const AppDividerWidget(
            color: Color(0xFF313131),
          ),
        ],
      ),
    );
  }

  /// 顶部相关部件
  Widget _topWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          /// 头像
          GestureDetector(
            onTap: () {
              /// 跳转博主的主页
              Get.to(BloghostPage());
            },
            child: ImageUtils.loadEncryptImage(
              item.bloggerAvatar,
              fit: BoxFit.cover,
              radius: 25,
              width: 50,
              height: 50,
              coverWidth: 40,
              coverHeight: 40,
            ),
          ),

          /// up名字和时间
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    item.bloggerName,
                    style: TextStyle(
                      fontSize: 15,
                      color: context.appTheme.secondTextColor,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                            color: context.appTheme.secondPrimary
                        ),
                        child: Text("至尊卡",
                          style: TextStyle(
                            fontSize: 12,
                            color: context.appTheme.blackColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Text(
                        IntDateConvertUtils.toFormatTimeByRecent(
                          item.notifyTime > 0 ? item.notifyTime : item.createdAt,
                        ),
                        style: TextStyle(
                          fontSize: 12,
                          color: context.appTheme.secondTextColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// 关注按钮
          GestureDetector(
            onTap: () {
              /// 点击关注 or 取消关注
              if (onFollowClick != null) {
                onFollowClick!(item);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2,horizontal: 7),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF00D542), width: 1.0),
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Obx(() {
                return Text(
                  item.followStateObs.value == 0 ? '+ 关注' : "已关注",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF00D542),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  /// 标题相关置顶 or 精华 样式
  WidgetSpan _visibleWidgetSpan(
    Color textColor,
    List<Color> bgColor,
    String text,
  ) {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      baseline: TextBaseline.ideographic,
      child: Container(
        height: 14,
        width: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: bgColor, // Colors for the gradient
            begin: Alignment.topCenter, // Start point of the gradient
            end: Alignment.bottomCenter, // End point of the gradient
          ),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Text(text, style: TextStyle(fontSize: 10, color: textColor)),
      ),
    );
  }

  /// 标题
  Widget _titleWidget(BuildContext context) {
    return RichText(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          if (item.isBoutique == 1)
            _visibleWidgetSpan(Colors.black, [
              Color(0xFFFF5208),
              Color(0xFFF2A21D),
            ], "精华"),
          TextSpan(
            text: item.isBoutique == 1 ? "\t\t" : "",
            style: TextStyle(
              fontFamily: context.theme.textTheme.labelSmall?.fontFamily,
            ),
          ),
          if (item.isTop == 1)
            _visibleWidgetSpan(Colors.black, [
              Color(0xFF2FCCF7),
              Color(0xFF00DF39),
            ], "置顶"),
          TextSpan(
            text: item.isTop == 1 ? "\t\t" : "",
            style: TextStyle(
              fontFamily: context.theme.textTheme.labelSmall?.fontFamily,
            ),
          ),
          TextSpan(
            text: item.postName,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  /// 中部封面图片展示
  Widget _midWidget() {
    final List<Widget> childWidget = [];
    final List<String> coverImages = item.coverImage.split(",");
    //最大图片数量
    final int maxLength = coverImages.length + item.postVideos.length;
    //图片
    for (int i = 0; i < coverImages.length; i++) {
      if (coverImages[i].isEmpty) {
        continue;
      }
      childWidget.add(
        _buildImage(
          maxLength,
          i,
          coverImages[i],
          i == 2 && maxLength > coverImages.length,
        ),
      );
      if (childWidget.length >= 3) {
        break;
      }
    }
    if (childWidget.length < 3) {
      //视频
      for (int i = 0; i < item.postVideos.length; i++) {
        if (childWidget.length >= 3) {
          break;
        }
        childWidget.add(
          _buildImage(
            maxLength,
            coverImages.length + i,
            item.postVideos[i].horizontalCover,
            true,
          ),
        );
      }
    }

    return Row(
      mainAxisAlignment:
          coverImages.length > 2
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
      children: childWidget,
    );
  }

  Widget _buildImage(
    int imageLength,
    int index,
    String imageUrl,
    bool isVideo,
  ) {
    return Flexible(
      fit: imageLength > 2 ? FlexFit.tight : FlexFit.loose,
      flex: 1,
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Stack(
          alignment:
              imageLength > 2
                  ? AlignmentDirectional.center
                  : AlignmentDirectional.centerStart,
          children: [
            Container(
              margin: EdgeInsets.only(right: imageLength > 2 ? 0 : 7),
              height: 100,
              width: 100,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ImageUtils.loadEncryptImage(
                      imageUrl,
                      fit: BoxFit.cover,
                      radius: 6,
                    ),
                  ),

                  /// 播放按钮图片，
                  if (isVideo)
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 30,
                        alignment: Alignment.center,
                        height: 30,
                        child: const Icon(Icons.play_arrow_rounded, size: 20),
                      ),
                    ),
                  if (imageLength > 3 && index == 2)
                    /// 图片数量提示，超出3张则显示这个部件
                    _imgCountPositioned(imageLength),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 显示图片数量
  Widget _imgCountPositioned(int imageLength) {
    /// 如果item数量大于3且是最后一个item，则显示数量部件
    return Positioned(
      bottom: 4,
      right: 4,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Text(
            "+${imageLength - 3}",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }

  /// 帖子 tag标签，根据UI此处应该有多个，实际接口只固定返回了一个
  Widget _bottomTag(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "#${item.postTypeName}",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12, color: context.appTheme.secondTextColor),
      ),
    );
  }

  /// 底部其他部件
  Widget _bottomOther(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// 浏览量
        MixIconText(
          icon: ImageUtils.loadAssetImage(
            AppAsset.assets.imagesIconViewCount,
            width: 16,
            height: 16,
          ),
          text: Text(
            item.viewCount,
            style: TextStyle(
              fontSize: 12,
              color: context.appTheme.secondTextColor,
            ),
          ),
        ),

        /// 点赞数
        SizedBox(
          width: 100,
          height: 20,
          child: GestureDetector(
            onTap: () {
              /// 点赞 or 取消点赞
              if (onLikeClick != null) {
                onLikeClick!(item);
              }
            },
            child: Obx(() {
              return MixIconText(
                icon: ImageUtils.loadAssetImage(
                  item.likeStateObs.value == 1 ? AppAsset.assets.imagesIconLike : AppAsset.assets.imagesIconLikeDefault,
                  width: 16,
                  height: 16,
                  fit: BoxFit.fill,
                ),
                text: Text(
                  item.likeCount.toUnit(),
                  style: TextStyle(
                    fontSize: 12,
                    color: context.appTheme.secondTextColor,
                  ),
                ),
              );
            }),
          ),
        ),

        /// 展示评论量
        _showComment(context),
        Expanded(child: _bottomTag(context)),
      ],
    );
  }

  /// 展示评论量
  Widget _showComment(BuildContext context) {
    /// 评论量
    return MixIconText(
      icon: ImageUtils.loadAssetImage(
        AppAsset.assets.imagesIconCommentCount,
        width: 16,
        height: 16,
      ),
      text: Text(
        "评论(${item.commentCount.toUnit()})",
        style: TextStyle(fontSize: 12, color: context.appTheme.secondTextColor),
      ),
    );
  }
}
