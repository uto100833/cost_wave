import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'lib/assets/tab_home.png',
      selectedImagePath: 'lib/assets/tab_home_selected.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'lib/assets/tab_transition.png',
      selectedImagePath: 'lib/assets/tab_transition_selected.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'lib/assets/tab_setting.png',
      selectedImagePath: 'lib/assets/tab_setting_selected.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'lib/assets/tab_profile.png',
      selectedImagePath: 'lib/assets/tab_profile_selected.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
