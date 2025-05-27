import 'package:get/get.dart';

import '../../../bean/post_list_bean.dart';

class PostListElementExt extends PostListElement {
  late RxInt likeStateObs;
  late RxInt followStateObs;

  PostListElementExt({
    required super.id,
    required super.postName,
    required super.price,
    required super.permission,
    required super.coverImage,
    required super.createdAt,
    required super.viewCountNum,
    required super.favoriteCount,
    required super.likeCount,
    required super.commentCount,
    required super.downloadCount,
    required super.postContent,
    required super.liteContent,
    required super.isHorizontal,
    required super.sort,
    required super.bloggerId,
    required super.bloggerName,
    required super.bloggerAvatar,
    required super.postTypeId,
    required super.postTypeName,
    required super.isLike,
    required super.isFav,
    required super.isFollow,
    required super.isEssence,
    required super.isTop,
    required super.isBuy,
    required super.collectionId,
    required super.collectionName,
    required super.tagName,
    required super.postVideos,
    required super.href,
    required super.notifyTime,
    required super.viewCount,
    required super.postType,
    required super.isBoutique,
    required super.collectionCoverImage,
  }) {
    likeStateObs = RxInt(isLike);
    followStateObs = RxInt(isFollow);
  }

  static PostListElementExt copyWith(PostListElement element) =>
      PostListElementExt(
        id: element.id,
        postName: element.postName,
        price: element.price,
        permission: element.permission,
        coverImage: element.coverImage,
        createdAt: element.createdAt,
        viewCountNum: element.viewCountNum,
        favoriteCount: element.favoriteCount,
        likeCount: element.likeCount,
        commentCount: element.commentCount,
        downloadCount: element.downloadCount,
        postContent: element.postContent,
        liteContent: element.liteContent,
        isHorizontal: element.isHorizontal,
        sort: element.sort,
        bloggerId: element.bloggerId,
        bloggerName: element.bloggerName,
        bloggerAvatar: element.bloggerAvatar,
        postTypeId: element.postTypeId,
        postTypeName: element.postTypeName,
        isLike: element.isLike,
        isFav: element.isFav,
        isFollow: element.isFollow,
        isEssence: element.isEssence,
        isTop: element.isTop,
        isBuy: element.isBuy,
        collectionId: element.collectionId,
        collectionName: element.collectionName,
        tagName: element.tagName,
        postVideos: element.postVideos,
        href: element.href,
        notifyTime: element.notifyTime,
        viewCount: element.viewCount,
        postType: element.postType,
        isBoutique: element.isBoutique,
        collectionCoverImage: element.collectionCoverImage,
      );
}
