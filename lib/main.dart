import 'package:flutter/material.dart';
import 'package:flutter_quanlychitieu/home_screen/home_screen.dart';
import 'package:flutter_quanlychitieu/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý chi tiêu',
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
