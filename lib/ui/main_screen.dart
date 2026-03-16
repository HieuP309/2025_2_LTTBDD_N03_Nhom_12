import 'package:flutter/material.dart';
import 'package:flutter_quanlychitieu/l10n/app_localizations.dart';
import 'about_screen/about_screen.dart';
import 'home_screen/home_screen.dart';
import 'setting_screen/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    SettingScreen(),
    HomeScreen(),
    AboutScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      print("pressed: $index");
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,

        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: l10n.settings,
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: l10n.home,
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: l10n.aboutMe,
          ),
        ],
      ),
    );
  }
}
