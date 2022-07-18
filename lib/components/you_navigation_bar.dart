import 'package:flutter/material.dart';

import '../constants/view_constants.dart';
import 'you_nav_bar_item.dart';

class YouNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;

  const YouNavigationBar({
    required this.onTap,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
        onTap: onTap,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ViewConstants.primaryColor,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        fixedColor: ViewConstants.accentColor,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        items: [
          YouNavBarItem.generate(
              label: 'Breakfast',
              icon: Icons.breakfast_dining_outlined,
              activeIcon: Icons.breakfast_dining),
          YouNavBarItem.generate(
            label: 'Lunch',
            icon: Icons.lunch_dining_outlined,
            activeIcon: Icons.lunch_dining,
          ),
          YouNavBarItem.generate(
            label: 'Dinner',
            icon: Icons.dinner_dining_outlined,
            activeIcon: Icons.dinner_dining,
          ),
          YouNavBarItem.generate(
            label: 'Dessert',
            icon: Icons.icecream_outlined,
            activeIcon: Icons.icecream,
          ),
          YouNavBarItem.generate(
            label: 'Snacks',
            icon: Icons.dining_outlined,
            activeIcon: Icons.dining,
          )
        ],
      ),
    );
  }
}
