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
      padding: const EdgeInsets.symmetric(vertical: 10.0), // 上下に10pxのスペース
      child: SizedBox(
        // 入力欄横幅
        width: MediaQuery.of(context).size.width * 0.7,
        // 入力欄高さ
        height: 48,
        child: Container(
          padding: const EdgeInsets.all(12),
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
          child: TextField(
            cursorColor: Colors.grey, // カーソルの色
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              labelText: widget.labelText,
            ),
          ),
        ),
      ),
    );
  }
}
