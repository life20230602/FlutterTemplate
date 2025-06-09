import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/src/builtins/image_builtin.dart';
import 'package:flutter_html/src/tree/image_element.dart';
import 'package:flutter_se/utils/image_utils.dart';

///增加默认图
class HtmlDefaultCoverImageBuiltIn extends ImageBuiltIn {
  HtmlDefaultCoverImageBuiltIn({this.imageWidth});

  final double? imageWidth;

  @override
  InlineSpan build(ExtensionContext context) {
    if (!_matchesNetworkImage(context)) {
      return super.build(context);
    }
    //只处理网络图片
    final element = context.styledElement as ImageElement;

    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Column(
        children: [
          Center(
            child: element.src.toEncryptNetworkImageWidget(width: getWidth(element),  radius: 5
            ,coverWidth: 120,coverHeight: getHeight(element)),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  double getWidth(ImageElement element) {
    if (imageWidth != null) {
      return imageWidth!;
    }
    if (element.width != null) {
      return element.width!.value;
    }
    return 120;
  }

  double getHeight(ImageElement element) {
    double height = 180;
    if (element.height != null) {
      height = element.height!.value;
    }
    return height;
  }

  bool _matchesNetworkImage(ExtensionContext context) {
    final attributes = context.attributes;
    if (attributes['src'] == null) {
      return false;
    }
    final src = Uri.tryParse(attributes['src']!);
    if (src == null) {
      return false;
    }
    return context.elementName == "img" &&
        networkSchemas.contains(src.scheme) &&
        !src.path.endsWith(".svg") &&
        (networkDomains == null || networkDomains!.contains(src.host)) &&
        (fileExtensions == null || src.path.endsWithAnyFileExtension(fileExtensions!));
  }
}

extension _SetFolding on String {
  bool endsWithAnyFileExtension(Iterable<String> endings) {
    for (final element in endings) {
      if (endsWith(".$element")) {
        return true;
      }
    }
    return false;
  }
}
