import 'package:flutter/material.dart';

import '../../../home/presentaion/screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    Center(child: Text('Search Screen')),
    Center(child: Text('Profile Screen')),
    Center(child: Text('Settings Screen')),
  ];

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = _currentIndex == index;
    return IconButton(
      icon: Icon(icon, color: isSelected ? Colors.teal : Colors.grey, size: 28),
      onPressed: () => setState(() => _currentIndex = index),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(Icons.home, 0),
              _buildNavItem(Icons.favorite_border, 1),
              _buildNavItem(Icons.chat_bubble_outline, 2),
              _buildNavItem(Icons.person_outline, 3),
            ],
          ),
        ),
      ),
    );
  }
}
