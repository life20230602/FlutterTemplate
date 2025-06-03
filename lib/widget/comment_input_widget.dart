import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/utils/image_utils.dart';
import 'package:get/get.dart';

import '../res/app_asset.dart';
import 'component/debounce_gesture_tab_widget.dart';

///评论输入
class CommentInputWidget extends StatelessWidget {
  ///搜索框上显示的文案
  final String hint;
  final String submit;

  final TextEditingController controller = TextEditingController();

  ///点击键盘上的回车键的回调
  Function(String text,TextEditingController controller)? onSubmitted;

  CommentInputWidget({
    super.key,
    this.hint = "我来抢楼",
    this.submit = "发送",
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      margin: const EdgeInsets.only(right: 25),
      child: Row(
        children: [Expanded(child: _buildInput(context)), _buildSubmitButton(context)],
      ),
    );
  }

  Widget _buildInput(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      ///圆角边框
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        color: context.appTheme.secondBgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: _buildTextField(),),
    );
  }

  ///构建搜索输入TextField
  TextField _buildTextField() {
    return TextField(
      ///设置键盘的类型
      keyboardType: TextInputType.text,
      controller: controller,
      ///键盘回车键的样式为搜索
      textInputAction: TextInputAction.none,

      ///只有苹果手机上有效果
      keyboardAppearance: Brightness.dark,

      ///最大行数
      maxLines: 1,

      ///输入文本格式过滤
      inputFormatters: [
        ///输入的内容长度限制
        LengthLimitingTextInputFormatter(50),
      ],

      ///输入框不自动获取焦点
      autofocus: false,
      style: const TextStyle(fontSize: 14, color: Colors.white),

      ///输入框的边框装饰
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        enabledBorder: InputBorder.none,//不设置边框
        ///设置提示文本
        hintText: hint,
      ),
    );
  }

  ///提交按钮
  Widget _buildSubmitButton(BuildContext context) {
    return DebounceGestureTabWidget(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppAsset.assets.imagesIconCommentSend.toAssetImageWidget(width: 24, height: 20
        ,color: context.appTheme.primary),
        Text(
          submit,
          style: TextStyle(fontSize: 14, color: context.theme.primaryColor),
        )
      ],
    ),onTap: (){
      onSubmitted!(controller.text,controller);
    },);
  }
}
