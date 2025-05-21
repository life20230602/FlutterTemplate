import 'package:flutter/material.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/widget/component/app_button_widget.dart';

import '../../../base/page/app_getx_base_page.dart';
import "input_exchange_code_logic.dart";

///输入兑换码
class InputExchangeCodePage extends AppGetXBasePage<InputExchangeCodeLogic> {
  InputExchangeCodePage({super.key});

  @override
  String title() {
    return "兑换码";
  }

  @override
  Widget buildChild(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 12, right: 12),
      child: Column(
        children: [
          Container(
            height: 44,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Color(0xff1C1D1E),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: TextField(
              autofocus: false,
              maxLines: 1,
              cursorColor: context.appTheme.primary,
              controller: logic.codeController,
              style: const TextStyle(
                color: Color(0xFFA09F9F),
                fontSize: 14,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  hintText: '请填写兑换码',
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  contentPadding: EdgeInsets.only(left: 15)),
            ),
          ),
          const Expanded(child: SizedBox(height: 1,)),
          GestureDetector(
            onTap: () {
              
            },
            child: AppButtonWidget(text: "提交", height: 41),
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }

  @override
  InputExchangeCodeLogic createController() {
    return InputExchangeCodeLogic();
  }
}
