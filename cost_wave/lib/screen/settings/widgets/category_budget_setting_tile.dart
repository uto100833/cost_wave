import 'package:flutter/material.dart';

class CategoryBudgetSettingTile extends StatelessWidget {
  const CategoryBudgetSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Set Category Budgets'),
      subtitle: const Text('Set goals for each spending category.'),
      trailing: const Icon(Icons.category),
      onTap: () {
        // Category budget setting logic
      },
    );
  }
}
