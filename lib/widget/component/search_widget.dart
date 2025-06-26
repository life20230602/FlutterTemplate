import 'package:flutter/material.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/component/app_text_field_widget.dart';

import '../../res/app_asset.dart';

///搜索
class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.readOnly = true,this.controller});

  final bool readOnly;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      alignment: Alignment.center,
      child: Container(
        height: 34,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2C2B),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            if (!readOnly)
              Expanded(
                child: AppTextFieldWidget(
                  hint: "母子 妇女 换妻 孕妇",
                  controller: controller,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFBDBDBD),
                  ),
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                ),
              )
            else
              const Expanded(child: Text(
                "母子 妇女 换妻 孕妇",
                style: TextStyle(fontSize: 14, color: Color(0xFFBDBDBD)),
              )),
            AppAsset.assets.imagesIconSearch.toAssetImageWidget(
              width: 17,
              height: 16,
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
