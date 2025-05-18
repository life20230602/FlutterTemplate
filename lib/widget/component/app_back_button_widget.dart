import 'package:flutter/material.dart';

import '../../res/style.dart';

typedef OnBackListener = Function();

///app 通用返回
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: IconButton(
        onPressed: () {
          Navigator.maybePop(context);
        },
        icon: Row(
          children: [
            Icon(
              size: 20,
              Icons.arrow_back_ios,
              color: color ?? context.appTheme.appBackButtonColor,
            ),
          ],
        ),
      ),
    );
  }
}
