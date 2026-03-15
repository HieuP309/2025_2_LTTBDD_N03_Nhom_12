import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
              "assets/avatar.jpg",
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Nhóm 12",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Nguyễn Văn Hiếu",
            style: TextStyle(fontSize: 18),
          ),

          const SizedBox(height: 5),

          const Text(
            "MSSV: 21012058",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
