import 'package:flutter/material.dart';

const List<String> choices = <String>['Sales', 'Materials', 'Labor', 'Utilities'];

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
          Text(
            widget.labelText, // ラベルのテキスト
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8), // ラベルとドロップダウンの間のスペース
          DropdownButton<String>(
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
        ],
      ),
    );
  }
}
