import 'package:cost_wave/app_theme.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6, // ボタン幅
      height: 48, // ボタン高さ
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.buildLightTheme().primaryColor, // 有効時の背景色
          foregroundColor: AppTheme.white, // テキストとアイコンの色
          elevation: 6, // 影の強さ
          shadowColor: AppTheme.grey.withOpacity(0.3), // 影の色
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0), // 角丸
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
