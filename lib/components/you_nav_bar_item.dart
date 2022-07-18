import 'package:flutter/material.dart';

import '../constants/view_constants.dart';

class YouNavBarItem {
  static BottomNavigationBarItem generate({
    required String label,
    required IconData icon,
    required IconData activeIcon,
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
          color: ViewConstants.accentColor,
        ),
      ),
      label: label,
    );
  }
}
