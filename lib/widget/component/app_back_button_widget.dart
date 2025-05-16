import 'package:flutter/material.dart';

import '../../res/style.dart';

typedef OnBackListener = Function();

///app 通用返回
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.maybePop(context);
        },
        icon: Row(
          children: [
            const SizedBox(width: 14,),
            Icon(
              size: 20,
              Icons.arrow_back_ios,
              color: color,
            )
          ],
        ));
  }
}
