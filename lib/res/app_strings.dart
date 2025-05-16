import 'flavor.dart';

abstract class AppString{
  static AppString get strings => Flavors().getAppString();

  ///app 名称
  String get appName;

  List<String> get apiHost;
}