import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;

import '../../../utils/app_dialog_utils.dart';

typedef ArticleLinkClickCallback = Function(int id);

///文章中的自定义超链接标签
class ArticleLinkWidget extends HtmlExtension {
  const ArticleLinkWidget({required this.maxWidth, required this.articleLinkClickCallback});

  final double maxWidth;

  final ArticleLinkClickCallback articleLinkClickCallback;

  @override
  Set<String> get supportedTags => {
        "article",
      };

  @override
  StyledElement prepare(ExtensionContext context, List<StyledElement> children) {
    final String id = context.attributes["id"] ?? "";
    return ArticleLinkElement(name: 'article-link-$id', style: Style(), elementId: id, node: context.node);
  }

  @override
  InlineSpan build(ExtensionContext context) {
    final String title = context.attributes["title"] ?? "";
    final String id = context.attributes["id"] ?? "";
    return WidgetSpan(
        child: GestureDetector(
      onTap: () {
        if (id.isEmpty) {
          AppDialogUtils.showToast("未找到对应的文章");
          return;
        }
        articleLinkClickCallback(int.parse(id));
      },
      child: Container(
        width: maxWidth,
        padding: const EdgeInsets.fromLTRB(11, 6, 11, 6),
        decoration: BoxDecoration(
          border: Border.all(color: Get.context!.appTheme.appGrey, width: 2.0),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    ));
  }
}

class ArticleLinkElement extends ReplacedElement {
  ArticleLinkElement({required super.name, required super.style, required super.elementId, required super.node});
}
