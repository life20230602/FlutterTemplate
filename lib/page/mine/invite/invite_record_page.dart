import 'package:flutter/material.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'invite_record_logic.dart';

/// 邀请记录
class CoinChargeRecordPage extends AppGetXBasePage<InviteRecordLogic> {
  CoinChargeRecordPage({super.key});

  @override
  InviteRecordLogic createController() => InviteRecordLogic();

  @override
  String title() => "邀请记录";

  @override
  Widget buildChild(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: ListView.separated(
        itemBuilder: (context, index) => _buildItem(context, index),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        },
        itemCount: 20,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10,12,25,12),
      decoration: BoxDecoration(
        color: context.appTheme.itemBgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Text("ID：123456",style: TextStyle(color: Colors.white,fontSize: 14),),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("邀请时间",style: TextStyle(color: Colors.white,fontSize: 14),),
              const SizedBox(height: 10,),
              Text("06/14/2024 14:14:14",style: TextStyle(color: context.appTheme.appGrey,fontSize: 12),),
            ],
          ))
        ],
      ),
    );
  }
}
