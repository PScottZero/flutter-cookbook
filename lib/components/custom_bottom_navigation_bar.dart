import 'package:flutter/material.dart';

import 'custom_bottom_navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;
  final Color backgroundColor;
  final Color fixedColor;
  final Color activeIconColor;

  const CustomBottomNavigationBar({
    required this.onTap,
    required this.selectedIndex,
    required this.backgroundColor,
    required this.fixedColor,
    required this.activeIconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: backgroundColor,
      fixedColor: fixedColor,
      selectedFontSize: 12.0,
      unselectedFontSize: 12.0,
      items: [
        CustomBottomNavigationBarItem.generate(
          label: 'Breakfast',
          icon: Icons.breakfast_dining_outlined,
          activeIcon: Icons.breakfast_dining,
          activeIconColor: activeIconColor,
        ),
        CustomBottomNavigationBarItem.generate(
          label: 'Lunch',
          icon: Icons.lunch_dining_outlined,
          activeIcon: Icons.lunch_dining,
          activeIconColor: activeIconColor,
        ),
        CustomBottomNavigationBarItem.generate(
          label: 'Dinner',
          icon: Icons.dinner_dining_outlined,
          activeIcon: Icons.dinner_dining,
          activeIconColor: activeIconColor,
        ),
        CustomBottomNavigationBarItem.generate(
          label: 'Dessert',
          icon: Icons.icecream_outlined,
          activeIcon: Icons.icecream,
          activeIconColor: activeIconColor,
        ),
        CustomBottomNavigationBarItem.generate(
          label: 'Snacks',
          icon: Icons.cookie_outlined,
          activeIcon: Icons.cookie,
          activeIconColor: activeIconColor,
        ),
        CustomBottomNavigationBarItem.generate(
          label: 'Drinks',
          icon: Icons.liquor_outlined,
          activeIcon: Icons.liquor,
          activeIconColor: activeIconColor,
        ),
      ],
    );
  }
}
