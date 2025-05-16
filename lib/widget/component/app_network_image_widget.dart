import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_se/utils/decrypt_utils.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import 'app_placeholder_widget.dart';

///app 网络图片加载
class AppNetworkImageWidget extends StatelessWidget {
  const AppNetworkImageWidget({
    super.key,
    this.placeholder,
    required this.imageUrl,
    this.width,
    this.coverWidth,
    this.height,
    this.coverHeight,
    this.radius = 0,
    this.decrypt = false,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final String? placeholder;
  final double? width;
  final double? height;
  final double? coverWidth;
  final double? coverHeight;
  final double radius;
  final bool decrypt;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (radius == 0) {
      return _buildImage();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: _buildImage(),
    );
  }

  ///图片widget
  Widget _buildImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      memCacheWidth: width?.toInt(),
      memCacheHeight: height?.toInt(),
      imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
      cacheKey: imageUrl.split("?")[0].toMd5(),
      cacheManager: decrypt ? DecryptImageCacheManager() : null,
      placeholder: (context, url) {
        return AppPlaceHolderWidget(
          width: coverWidth ?? width,
          height: coverHeight ?? height,
        );
      },
      errorWidget: (context, url, error) {
        return AppPlaceHolderWidget(
          width: coverWidth ?? width,
          height: coverHeight ?? height,
        );
      },
      width: width,
      height: height,
      fit: fit,
    );
  }
}

///加载解密的网络图片使用的缓存
class DecryptImageCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'libCachedImageData';

  static final DecryptImageCacheManager _instance =
      DecryptImageCacheManager._();

  factory DecryptImageCacheManager() {
    return _instance;
  }

  DecryptImageCacheManager._()
    : super(Config(key, fileService: DecryptImageHttpFileService()));
}

/// [HttpFileService] is the most common file service and the default for
/// [WebHelper]. One can easily adapt it to use dio or any other http client.
class DecryptImageHttpFileService extends FileService {
  final http.Client _httpClient;

  DecryptImageHttpFileService({http.Client? httpClient})
    : _httpClient = RetryClient(http.Client());

  @override
  Future<FileServiceResponse> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    final httpResponse = await _httpClient.get(
      Uri.parse(url),
      headers: headers,
    );
    var stream = http.ByteStream.fromBytes([0]);
    if (httpResponse.statusCode == 200) {
      stream = http.ByteStream.fromBytes(
        DecryptUtils.decryptImage(httpResponse.bodyBytes),
      );
    }
    return HttpGetResponse(
      http.StreamedResponse(
        stream,
        httpResponse.statusCode,
        contentLength: httpResponse.contentLength,
        request: httpResponse.request,
        headers: httpResponse.headers,
        isRedirect: httpResponse.isRedirect,
        persistentConnection: httpResponse.persistentConnection,
        reasonPhrase: httpResponse.reasonPhrase,
      ),
    );
  }
}
