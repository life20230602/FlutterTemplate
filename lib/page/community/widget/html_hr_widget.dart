import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:get/get.dart';

typedef ArticleLinkClickCallback = Function(int id);

///文章中的自定义超链接标签
class HtmlHrWidget extends HtmlExtension {
  const HtmlHrWidget({required this.maxWidth});

  final double maxWidth;

  @override
  Set<String> get supportedTags => {
        "hr",
      };

  @override
  StyledElement prepare(ExtensionContext context, List<StyledElement> children) {
    return HtmlHrElement(name: 'hr', style: Style(), elementId: "hr", node: context.node);
  }

  @override
  InlineSpan build(ExtensionContext context) {
    return WidgetSpan(
        child: Container(
      height: 1,
      color: Get.context!.appTheme.appGrey,
    ));
  }
}

class HtmlHrElement extends ReplacedElement {
  HtmlHrElement({required super.name, required super.style, required super.elementId, required super.node});
}
