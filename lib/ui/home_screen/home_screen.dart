import 'package:flutter/material.dart';
import '../../database/db_helper.dart';
import 'add_expense_screen.dart';
import 'expense_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List expenses = [];
  int total = 0;

  loadExpenses() async {
    final data = await DBHelper.getExpenses();

    int sum = 0;

    for (var e in data) {
      sum += e["money"] as int;
    }

    setState(() {
      expenses = data;
      total = sum;
    });
  }

  @override
  void initState() {
    super.initState();
    loadExpenses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        255,
        212,
        212,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const AddExpenseScreen(),
            ),
          );

          loadExpenses();
        },
        child: const Icon(Icons.add),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tổng chi: $total đ",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Danh mục",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Số tiền",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Ngày",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const Divider(),

                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemCount: expenses.length,
                        itemBuilder: (context, index) {
                          final e = expenses[index];

                          return Dismissible(
                            key: Key(e["id"].toString()),
                            direction:
                                DismissDirection.endToStart,
                            background: Container(
                              color: Colors.red,
                              alignment:
                                  Alignment.centerRight,
                              padding:
                                  const EdgeInsets.only(
                                    right: 20,
                                  ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            confirmDismiss: (direction) async {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                      'Xác nhận xóa',
                                    ),
                                    content: const Text(
                                      'Bạn có chắc muốn xóa bản ghi này?',
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(
                                              context,
                                            ).pop(false),
                                        child: const Text(
                                          'Hủy',
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(
                                              context,
                                            ).pop(true),
                                        child: const Text(
                                          'Xóa',
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            onDismissed: (direction) async {
                              await DBHelper.deleteExpense(
                                e["id"],
                              );
                              loadExpenses();
                            },
                            child: ExpenseRow(
                              name: e["name"],
                              money: e["money"].toString(),
                              date:
                                  DateTime.parse(e["date"])
                                      .toLocal()
                                      .toString()
                                      .split(' ')[0],
                              note: e["note"],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
