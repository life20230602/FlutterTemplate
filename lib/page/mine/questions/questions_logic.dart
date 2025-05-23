import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/utils/app_dialog_utils.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'entity/question_entity.dart';

/// 常见问题
class QuestionsLogic extends AppGetXBaseLogic {

  final itemList = <QuestionEntity>[].obs;

  ///记录当前展开的
  QuestionEntity? expandEntity;

  @override
  void onLoad() {
    itemList.add(QuestionEntity(data: "data11111"));
    itemList.add(QuestionEntity(data: "是的发发撒发发撒"));
    itemList.add(QuestionEntity(data: "发的顺丰的手机卡过来绝对时空"));
    showSuccess();
  }

  ///展开或者隐藏显示
  void toggleItem(QuestionEntity entity){
    if(entity == expandEntity && entity.isExpand()){
      entity.setExpandStatus(false);
      return;
    }
    if(expandEntity != null){
      expandEntity!.setExpandStatus(false);
    }
    entity.setExpandStatus(!entity.isExpand());
    expandEntity = entity;
  }
}
