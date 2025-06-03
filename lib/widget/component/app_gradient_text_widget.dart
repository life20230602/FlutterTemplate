import 'package:flutter/cupertino.dart';

class AppGradientTextWidget extends StatelessWidget {
  const AppGradientTextWidget({
    super.key,
    required this.text,
    this.fontSize = 21,
    this.textAlign = TextAlign.start,
    this.gradientColors = const [Color(0xFFFFE7C3), Color(0xFFEFB96F)],
  });

  final String text;
  final double fontSize;
  final List<Color> gradientColors;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(colors: gradientColors).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: Text(text, style: TextStyle(fontSize: fontSize,height: 1),textAlign: textAlign,),
    );
  }
}
