import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  const CustomTextField({super.key, required this.labelText});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0), // 上下の余白
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // ラベルを左揃え
        children: [
          // ラベル
          Text(
            widget.labelText, // ラベルのテキスト
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey, // ラベルの色
            ),
          ),
          const SizedBox(height: 8), // ラベルと入力欄の間のスペース
          // 入力欄
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7, // 横幅を調整
            height: 48, // 高さを固定
            child: Container(
              padding: const EdgeInsets.all(0), // 内側の余白をリセット
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  const BoxShadow(color: Colors.grey),
                  BoxShadow(
                    color: Colors.grey.shade100, // 影の色
                    offset: const Offset(-5, -5), // 影の位置
                    blurRadius: 10, // 影のぼかし半径
                    spreadRadius: -1, // 影の拡散半径
                  ),
                  const BoxShadow(
                    color: Colors.white, // 影の色
                    offset: Offset(5, 5), // 影の位置
                    blurRadius: 10, // 影のぼかし半径
                    spreadRadius: -1, // 影の拡散半径
                  ),
                ],
              ),
              child: const TextField(
                cursorColor: Colors.grey, // カーソルの色
                style: TextStyle(
                  fontSize: 16, // テキストのフォントサイズ
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12, // 上下の余白を調整
                    horizontal: 12, // 左右の余白を調整
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
