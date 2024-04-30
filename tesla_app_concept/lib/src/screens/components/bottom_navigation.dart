import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';

class TeslaAppBottomNavigation extends StatelessWidget {
  TeslaAppBottomNavigation({
    super.key,
    required this.onTap,
    required this.selectedTab,
  });


  final ValueChanged<int> onTap;
  final int selectedTab;

  static List<String> _tabsIcons = [
    "assets/icons/Lock.svg",
    "assets/icons/Charge.svg",
    "assets/icons/Temp.svg",
    "assets/icons/Tyre.svg"
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: selectedTab,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      items: List.generate(
        _tabsIcons.length,
        (index) => BottomNavigationBarItem(
          icon: SvgPicture.asset(
            _tabsIcons[index],
            colorFilter: ColorFilter.mode(index == selectedTab ? primaryColor : Colors.white54, BlendMode.srcIn),
          ),
          label: "",
        ),
      ),
    );
  }
}
