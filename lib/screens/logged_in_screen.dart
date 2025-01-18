import 'package:flutter/material.dart';
import 'package:pointx/screens/history_screen.dart';
import 'package:pointx/screens/settings_screen.dart';
import 'package:pointx/screens/store_screen.dart';
import 'package:pointx/screens/swap_screen.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({super.key});

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  int _selectedIndex = 0;
  final List<Widget> screens = [
    const StoreScreen(),
    const HistoryScreen(),
    const SwapScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // to keep the size, when opening the keyboard
      body: screens[_selectedIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color(0xFF614FA8),
        unselectedItemColor: const Color(0xFFD0D0D0),
        iconSize: 36,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              size: 36,
              Icons.house_rounded,
            ),
            label: 'Points',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history_rounded,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.swap_vert_circle_rounded,
            ),
            label: 'Swap',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_rounded,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
