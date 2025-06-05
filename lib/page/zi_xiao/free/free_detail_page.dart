import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/page/common/video/video_list_page.dart';
import 'package:flutter_se/res/app_asset.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:flutter_se/widget/widget_utils.dart';

import 'free_detail_head_widget.dart';
import 'free_detail_logic.dart';

///免费看片详情
class FreeDetailPage extends AppGetXBasePage<FreeDetailLogic> {
  FreeDetailPage({super.key});

  @override
  createController() => FreeDetailLogic();

  @override
  String title() => "视频名称";

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 15, 12, 0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeadInfo()),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          const SliverToBoxAdapter(
            child: Text(
              "剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧"
              "情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情剧情",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          const SliverToBoxAdapter(child: const SizedBox(height: 20)),
          const SliverToBoxAdapter(
            child: const Text(
              "正片/剧照",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 15)),
          SliverToBoxAdapter(child: _buildVideoPreview()),
          _buildComment(),
          const SliverToBoxAdapter(
            child: Text(
              "关联剧情",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 15,),),
          SliverToBoxAdapter(child: _buildRelativeVideoInfo()),
          const SliverToBoxAdapter(child: SizedBox(height: 20,),),
        ],
      ),
    );
  }

  Widget _buildComment() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Text("评论");
      }, childCount: 10),
    );
  }

  ///视频预览信息
  Widget _buildVideoPreview() {
    return SizedBox(
      height: 152,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 460 / 305,
            child: AppAsset.assets.imagesIconMineShare.toAssetImageWidget(
              fit: BoxFit.fill,
              radius: 5,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 5);
        },
        itemCount: 4,
      ),
    );
  }

  ///关联视频
  Widget _buildRelativeVideoInfo() {
    return SizedBox(
      height: 152,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 340 / 283,
            child: Column(
              children: [
                Expanded(
                  child: AppAsset.assets.imagesIconMineShare.toAssetImageWidget(
                    fit: BoxFit.fill,
                    radius: 5,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "我是两行标题我是两行标题我是两行标题",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 5);
        },
        itemCount: 4,
      ),
    );
  }

  ///头部信息
  Widget _buildHeadInfo() {
    return const FreeDetailHeadWidget();
  }
}
