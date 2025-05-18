import 'package:flutter/material.dart';
import 'package:flutter_se/utils/image_utils.dart';

import '../../res/app_asset.dart';

///搜索
class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      alignment: Alignment.center,
      child: Container(
        height: 31,
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
            SizedBox(width: 10,),
            Expanded(child: Text(
              "母子 妇女 换妻 孕妇",
              style: TextStyle(fontSize: 14, color: Color(0xFFBDBDBD)),
            )),
            AppAsset.assets.imagesIconSearch.toAssetImageWidget(
                width: 17,height: 16
            ),
            SizedBox(width: 8,),
          ],
        ),
      ),
    );
  }
}
