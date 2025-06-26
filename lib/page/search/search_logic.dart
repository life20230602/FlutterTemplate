import 'package:flutter/cupertino.dart';
import 'package:flutter_se/base/logic/app_base_logic.dart';
import 'package:flutter_se/utils/cache_utils.dart';
import 'package:get/get.dart';

///搜索界面
class SearchLogic extends AppGetXBaseLogic{
  final TextEditingController controller = TextEditingController();
  final String _cacheKey = "searchHistoryKeywords";

  final searchHistoryKeywords = <String>[].obs;

  @override
  void onLoad() {
    final string = CacheUtils.getString(_cacheKey);
    if(string != null){
      string.split("##").forEach((e){
        if(e.isEmpty){
          return;
        }
        searchHistoryKeywords.add(e);
      });
    }
    showSuccess();
  }

  ///搜索
  search() {
    if(controller.text.isEmpty){
      return;
    }
    searchHistoryKeywords.add(controller.text);
  }

  @override
  void onClose() {
    super.onClose();
    if(searchHistoryKeywords.isEmpty){
      return;
    }
    //保存记录
    String sb = "";
    for (var value in searchHistoryKeywords) {
      sb = "$sb##$value";
    }
    CacheUtils.putString(_cacheKey, sb);
  }
}