import 'package:flutter/material.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:flutter_se/base/page/app_getx_base_page.dart';

import 'scan_qrcode_logic.dart';

///扫码二维码
class ScanQrcodePage extends AppGetXBasePage<ScanQrcodeLogic> {
  ScanQrcodePage({super.key});

  @override
  String title() {
    return "扫描二维码";
  }

  @override
  bool showLoadingPage() => false;

  @override
  ScanQrcodeLogic createController() {
    return ScanQrcodeLogic();
  }

  @override
  Widget buildChild(BuildContext context) {
    final double boxSize = 200;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var left = screenWidth / 2 - boxSize / 2;
    var top = screenHeight / 2 - boxSize / 2;
    var rect = Rect.fromLTWH(left, top, boxSize, boxSize);

    return Stack(
      children: [
        ScanKitWidget(
          controller: logic.scanKitController,
          continuouslyScan: false,
          boundingBox: rect,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: boxSize,
            height: boxSize,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.orangeAccent, width: 2),
                right: BorderSide(color: Colors.orangeAccent, width: 2),
                top: BorderSide(color: Colors.orangeAccent, width: 2),
                bottom: BorderSide(color: Colors.orangeAccent, width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
