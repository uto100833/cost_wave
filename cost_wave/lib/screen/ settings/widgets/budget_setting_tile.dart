import 'package:flutter/material.dart';

class BudgetSettingTile extends StatelessWidget {
  const BudgetSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Set Total Budget'),
      subtitle: const Text('Set a budget limit for the entire app.'),
      trailing: const Icon(Icons.edit),
      onTap: () {
        // Budget setting logic
      },
    );
  }
}
