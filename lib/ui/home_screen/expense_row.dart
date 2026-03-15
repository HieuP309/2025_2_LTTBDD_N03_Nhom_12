import 'package:flutter/material.dart';

class ExpenseRow extends StatelessWidget {
  final String name;
  final String money;
  final String date;
  final String? note;

  const ExpenseRow({
    super.key,
    required this.name,
    required this.money,
    required this.date,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(name)),
              Text(money),
              const SizedBox(width: 16),
              Text(date),
            ],
          ),
          if (note != null && note!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Ghi chú: $note',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
