import 'package:flutter/material.dart';

import '../../../app_theme.dart';

class InputCostView extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final List<Widget> widgets;

  const InputCostView(
      {super.key,
      this.animationController,
      this.animation,
      required this.widgets});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(68.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: AppTheme.grey.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Column(
                  children: [
                    ...widgets,
                    const SizedBox(height: 24), // ボタンとの間隔
                    _buildSubmitButton(context),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6, // ボタン幅
      height: 48, // ボタン高さ
      child: ElevatedButton(
        onPressed: () {
          // 登録ボタンの動作をここに記述
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppTheme.grey; // 無効時の背景色
            }
            return Colors.transparent; // 有効時の背景色
          }),
          foregroundColor:
              WidgetStateProperty.all(AppTheme.white), // テキストとアイコンの色
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.transparent.withOpacity(0.7); // 押下時のエフェクト色
            }
            return null;
          }),
          elevation: WidgetStateProperty.all(6), // 影の強さ
          shadowColor:
              WidgetStateProperty.all(AppTheme.grey.withOpacity(0.3)), // 影の色
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0), // 角丸
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(vertical: 12), // 内側の余白
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 20), // ボタンのアイコン
            SizedBox(width: 8),
            Text(
              '登録',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
