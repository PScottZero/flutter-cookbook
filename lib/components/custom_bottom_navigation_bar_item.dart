import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem {
  static BottomNavigationBarItem generate({
    required String label,
    required IconData icon,
    required IconData activeIcon,
    required Color activeIconColor,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(icon),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.all(8),
        child: Icon(
          activeIcon,
          color: activeIconColor,
        ),
      ),
      label: label,
    );
  }
}
