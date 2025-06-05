import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/utils/image_utils.dart';

/// 我的界面 浏览记录
class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.separated(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 7);
        },
        itemBuilder: (context, index) {
          return _buildItem();
        },
      ),
    );
  }

  ///构建 item
  Widget _buildItem() {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          Expanded(
            child: AppAsset.assets.imagesIconMineShare.toAssetImageWidget(
              radius: 10,
              fit: BoxFit.cover
            ),
          ),
          const SizedBox(height: 2,),
          const Text(
            "标题标题标题标题标题",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
