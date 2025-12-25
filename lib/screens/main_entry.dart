import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import 'course_detail_screen.dart';
import 'home_screen.dart';
import 'my_classes_screen.dart';

import 'notification_screen.dart';

class MainEntryScreen extends StatefulWidget {
  const MainEntryScreen({super.key});

  @override
  State<MainEntryScreen> createState() => _MainEntryScreenState();
}

class _MainEntryScreenState extends State<MainEntryScreen> {
  int _currentIndex = 0; // Default to Home

  final List<Widget> _pages = [
    const HomeScreen(), // Home
    const MyClassesScreen(), // Kelas Saya
    const NotificationScreen(), // Notifikasi
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFFC62828), // Deep Red Background
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: const Color(0xFFC62828),
          selectedItemColor: Colors.white, // Selected is White
          unselectedItemColor: Colors.white.withOpacity(0.6), // Unselected is dim white
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Kelas Saya',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifikasi',
            ),
          ],
        ),
      ),
    );
  }
}
