import 'package:flutter/material.dart';

const List<String> choices = <String>[
  'Sales',
  'Materials',
  'Labor',
  'Utilities'
];

class DropdownButtonMenu extends StatefulWidget {
  const DropdownButtonMenu({super.key, required this.labelText});

  final String labelText;

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  String isSelectedValue = choices.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0), // 上下の余白
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // ラベルを左揃え
        children: [
          // ラベル部分
          Text(
            widget.labelText, // ラベルのテキスト
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8), // ラベルとドロップダウンの間のスペース

          // ドロップダウンのコンテナ
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7, // 横幅を調整
            height: 48, // 高さを入力欄に合わせる
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true, // 横幅を親に合わせる
                  items: choices.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: isSelectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      isSelectedValue = value!;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
