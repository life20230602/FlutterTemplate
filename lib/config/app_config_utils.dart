// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter_se/utils/cache_utils.dart';
//
// ///app 配置信息
// class AppConfigUtils {
//   AppConfigUtils._internal();
//
//   factory AppConfigUtils() => _instance;
//
//   static final AppConfigUtils _instance = AppConfigUtils._internal();
//
//   final String _keyChannelCode = "key_channel_code";
//   final String _keyUmengChannelCode = "key_umeng_channel_code";
//   final String _keyInviteCode = "key_invite_code";
//
//   ///渠道号
//   String _channelCode = "";
//
//   ///友盟渠道号
//   String _umengChannelCode = "";
//
//   ///邀请码
//   String _userInvite = "";
//
//   String getChannelCode() => _channelCode;
//
//   String getUmengChannelCode() => _umengChannelCode;
//
//   String getUserInviteCode() => _userInvite;
//
//   ///打包配置的存储桶
//   List<String> getApiHost() {
//     const apiHost = String.fromEnvironment("api_host");
//     if (apiHost.isEmpty) {
//       return [];
//     }
//     return apiHost.split(",");
//   }
//
//   ///初始化
//   init() async {
//     await _initChannelCode();
//     _initUserInviteCode();
//   }
//
//   ///邀请码
//   void _initUserInviteCode() {
//     if (_userInvite.isNotEmpty) {
//       return;
//     }
//     var inviteCode = CacheUtils.getString(_keyInviteCode) ?? "";
//     if (kIsWeb && inviteCode.isEmpty) {
//       inviteCode = _parseWebInviteCode();
//       CacheUtils.putString(_keyInviteCode, inviteCode);
//     }
//     _userInvite = inviteCode;
//   }
//
//   ///初始化渠道信息
//   _initChannelCode() async {
//     if (_channelCode.isNotEmpty) {
//       return;
//     }
//     var channelCode = CacheUtils.getString(_keyChannelCode) ?? "";
//     var umengChannelCode = CacheUtils.getString(_keyUmengChannelCode) ?? "";
//     if (channelCode.isNotEmpty) {
//       _channelCode = channelCode;
//       _umengChannelCode = umengChannelCode;
//       return;
//     }
//     if (kIsWeb) {
//       channelCode = _parseWebChannelCode();
//     } else if (Platform.isAndroid) {
//       channelCode = await FlutterMetaData.getMetaDataValue("channel");
//       umengChannelCode = await FlutterMetaData.getMetaDataValue("channelCode");
//     } else {
//       //ios 无法通过打包平台，手动配置
//       channelCode = "default-ios";
//       umengChannelCode = channelCode;
//     }
//     CacheUtils.putString(_keyChannelCode, _channelCode = channelCode);
//     CacheUtils.putString(
//         _keyUmengChannelCode, _umengChannelCode = umengChannelCode);
//   }
//
//   ///解析web渠道
//   String _parseWebChannelCode() {
//     var url = Uri.base.toString();
//     var uri = Uri.parse(url.replaceFirst('#/', ''));
//     var code = uri.queryParameters['channel_code'] ?? "default-web";
//     return code;
//   }
//
//   ///解析web邀请码
//   String _parseWebInviteCode() {
//     var url = Uri.base.toString();
//     var uri = Uri.parse(url.replaceFirst('#/', ''));
//     var code = uri.queryParameters['user_invite'] ?? "";
//     return code;
//   }
// }
