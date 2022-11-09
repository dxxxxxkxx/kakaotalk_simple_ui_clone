import 'package:flutter/material.dart';

class BottomNavigationBarItem {
  final Widget icon;
  final Widget activeIcon;
  final String label;

  BottomNavigationBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}
