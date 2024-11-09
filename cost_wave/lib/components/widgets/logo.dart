import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;
  const Logo({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.center, // 中央部分を表示
        widthFactor: 0.99, // 横のトリミング割合
        heightFactor: 0.99, // 縦のトリミング割合
        child: Image.asset('lib/assets/cost_wave_logo.png'),
      ),
    );
  }
}
