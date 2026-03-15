import 'package:flutter/material.dart';

class ExpenseRow extends StatelessWidget {
  final String name;
  final String money;

  const ExpenseRow({
    super.key,
    required this.name,
    required this.money,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(name), Text(money)],
      ),
    );
  }
}
