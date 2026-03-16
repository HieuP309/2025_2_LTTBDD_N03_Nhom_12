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
      appBar: AppBar(title: Text(l10n.addExpense)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: l10n.expenseName,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: moneyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: l10n.expenseAmount,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: noteController,
              decoration: InputDecoration(
                labelText: l10n.noteOptional,
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveExpense,
              child: Text(l10n.save),
            ),
          ],
        ),
      ),
    );
  }
}
