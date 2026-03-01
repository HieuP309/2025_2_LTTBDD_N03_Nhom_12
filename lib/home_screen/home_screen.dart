import 'package:flutter/material.dart';
import 'expense_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        255,
        212,
        212,
      ),

      // nút add chi tiêu mới
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // thêm logic xử lý khi bấm nút
        },
        child: const Icon(Icons.add),
      ),

      // nav bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // ====== CARD TỔNG CHI ======
              Container(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    // Tiêu đề
                    const Text(
                      "Tổng chi:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Header bảng
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
                      ],
                    ),

                    const Divider(),

                    // danh sách tạm để show ui
                    SizedBox(
                      height: 200,
                      child: ListView(
                        children: const [
                          ExpenseRow(
                            name: "Ăn uống",
                            money: "200k",
                          ),
                          ExpenseRow(
                            name: "Đi lại",
                            money: "100k",
                          ),
                          ExpenseRow(
                            name: "Mua sắm",
                            money: "500k",
                          ),
                        ],
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
