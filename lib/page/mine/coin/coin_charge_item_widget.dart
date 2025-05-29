import 'package:flutter/cupertino.dart';

/// 金币充值 item 样式
class CoinChargeItemWidget extends StatelessWidget {
  const CoinChargeItemWidget({super.key, required this.checked});

  final bool checked;

  @override
  Widget build(BuildContext context) {
    if (checked) {
      return SizedBox(
        height: 110,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _build(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFFFE7C3)),
              ),
            ),
          ],
        ),
      );
    }
    return _build();
  }

  Widget _build() {
    return Container(
      height: 110,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Color(0xFF555049), Color(0xFF413A31)],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("1000", style: TextStyle(fontSize: 20)),
              Text("金币", style: TextStyle(fontSize: 14)),
            ],
          ),
          Text("100", style: TextStyle(fontSize: 12)),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [Color(0xFFFFE7C3), Color(0xFFEFB96F)],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Text("赠送200金币", style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
