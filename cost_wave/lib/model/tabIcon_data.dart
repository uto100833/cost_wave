import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.icon = Icons.settings,
    this.index = 0,
    this.selectedIcon = Icons.settings,
    this.isSelected = false,
    this.animationController,
  });

  IconData icon;
  IconData selectedIcon;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      icon: Icons.insert_chart_outlined,
      selectedIcon: Icons.insert_chart,
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      icon: Icons.notifications_none_outlined,
      selectedIcon: Icons.notifications_active,
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
      index: 0,
      isSelected: true,
      animationController: null,
    ),
  ];
}
