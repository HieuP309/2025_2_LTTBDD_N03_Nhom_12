import 'package:flutter/material.dart';
import 'package:flutter_quanlychitieu/l10n/app_localizations.dart';
import '../../database/db_helper.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() =>
      _AddExpenseScreenState();
}

class _AddExpenseScreenState
    extends State<AddExpenseScreen> {
  final nameController = TextEditingController();
  final moneyController = TextEditingController();
  final noteController = TextEditingController();

  saveExpense() async {
    String name = nameController.text;
    int money = int.parse(moneyController.text);
    String date = DateTime.now().toIso8601String();
    String note = noteController.text;

    await DBHelper.insertExpense(name, money, date, note);

    Navigator.pop(context); // quay lại home
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.addExpense),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Thêm khoản chi mới',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Điền thông tin chi tiêu của bạn',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),

              // Expense name field
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: l10n.expenseName,
                  hintText: 'Ví dụ: Ăn uống, Di chuyển...',
                  prefixIcon: const Icon(Icons.category),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Amount field
              TextField(
                controller: moneyController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: l10n.expenseAmount,
                  hintText: 'Nhập số tiền (VNĐ)',
                  prefixIcon: const Icon(Icons.attach_money),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Note field
              TextField(
                controller: noteController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: l10n.noteOptional,
                  hintText: 'Thêm ghi chú nếu cần...',
                  prefixIcon: const Icon(Icons.note),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: saveExpense,
                  icon: const Icon(Icons.save),
                  label: Text(l10n.save),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
