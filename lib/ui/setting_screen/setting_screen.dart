import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() =>
      _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Language",
              style: TextStyle(fontSize: 18),
            ),

            Row(
              children: [
                const Text("VN"),

                Switch(
                  value: isEnglish,
                  onChanged: (value) {
                    setState(() {
                      isEnglish = value;
                    });
                  },
                ),

                const Text("EN"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
