import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';

import '../../../res/app_asset.dart';

///ai 中心头部
class AiCenterHeadWidget extends StatelessWidget {
  const AiCenterHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildAvatar(),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "名字名字名字名字名字名字名字名字",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              Text(
                "您还不是会员",
                style: TextStyle(
                  fontSize: 14,
                  color: context.appTheme.secondTextColor,
                ),
              ),
            ],
          ),
        ),
        _buildAiVipInfoItem(context,"0次","脱衣"),
        const SizedBox(width: 20,),
        _buildAiVipInfoItem(context,"0次","图片换脸"),
        const SizedBox(width: 20,),
        _buildAiVipInfoItem(context,"0次","视频换脸"),
      ],
    );
  }

  ///头像
  Widget _buildAvatar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: AppAsset.assets.imagesIconSetting.toAssetImageWidget(
            size: 56,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white),
          ),
        ),
      ],
    );
  }

  ///vip信息
  Widget _buildAiVipInfoItem(BuildContext context,String text,String desc){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style: TextStyle(fontSize: 13,color: context.appTheme.primary),),
        Text(desc,style: TextStyle(fontSize: 11,color: context.appTheme.secondTextColor),),
      ],
    );
  }
}
