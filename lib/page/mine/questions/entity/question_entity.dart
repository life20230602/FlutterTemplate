import 'package:get/get.dart';

class QuestionEntity {
  String data;

  //控制描述的显示隐藏
  final expandStatus = false.obs;

  QuestionEntity({required this.data});

  //是否展开
  bool isExpand() => expandStatus.value;

  void setExpandStatus(bool expand) {
    expandStatus.value = expand;
  }
}
