import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_se/res/app_theme.dart';
import 'package:flutter_se/route/route_utils.dart';
import 'package:flutter_se/utils/cache_utils.dart';
import 'package:flutter_se/utils/refresh_utils.dart';
import 'package:flutter_se/widget/component/keyboard_widget.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:keyboard_detection/keyboard_detection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化
  await CacheUtils.init();
  //加大图片缓存
  PaintingBinding.instance.imageCache.maximumSize = 2000;
  PaintingBinding.instance.imageCache.maximumSizeBytes = 200 << 20;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      // 设置状态栏透明
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: context.appTheme.appBottomBarBgColor,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }

    /// 刷新控件统一配置
    EasyRefresh.defaultHeaderBuilder = () {
      return RefreshUtils.header();
    };
    EasyRefresh.defaultFooterBuilder = () {
      return RefreshUtils.footer();
    };

    return KeyboardDetection(
      controller: KeyboardWidget.keyboardDetectionController,
      child: GetMaterialApp(
        title: '密信',
        defaultTransition: Transition.rightToLeft,
        locale: Locale("zh", "CN"),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          //是Flutter的一个本地化委托，用于提供Material组件库的本地化支持
          GlobalWidgetsLocalizations.delegate,
          //用于提供通用部件（Widgets）的本地化支持
          GlobalCupertinoLocalizations.delegate,
          //用于提供Cupertino风格的组件的本地化支持
        ],
        supportedLocales: [
          const Locale('zh', 'CN'), // 支持的语言和地区
        ],
        theme: ThemeData(
          // fontFamily: "txt",
          brightness: Brightness.dark,
          canvasColor: Colors.black,
          focusColor: context.appTheme.primary,
          primaryColor: context.appTheme.primary,
          appBarTheme: AppBarTheme(
            scrolledUnderElevation: 0.0,
            titleTextStyle: TextStyle(
              fontSize: 17,
              color: context.appTheme.titleTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          useMaterial3: true,
          // 去除TabBar底部线条
          tabBarTheme: const TabBarTheme(
            dividerColor: Colors.transparent,
            labelStyle: TextStyle(fontFamily: "txt"),
          ),
        ),
        initialRoute: "/",
        popGesture: true,
        navigatorObservers: [FlutterSmartDialog.observer],
        getPages: RouteUtils.pages,
        builder: FlutterSmartDialog.init(),
      ),
    );
  }
}
