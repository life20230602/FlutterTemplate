import 'package:flutter/cupertino.dart';
import 'package:flutter_se/res/app_theme.dart';

///作品记录
class AppTitleRightButtonWidget extends StatelessWidget {
  const AppTitleRightButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        strutStyle: const StrutStyle(forceStrutHeight: true),
        style: TextStyle(fontSize: 15, color: context.appTheme.titleTextColor),
      ),
    );
  }
}
