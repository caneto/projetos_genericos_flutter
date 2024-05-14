import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../constants/app_colors.dart';
import '../cart/cart_page.dart';
import '../favourites/favourite_page.dart';
import '../home/home_page.dart';
import '../profile/profile_page.dart';

class EntryPointUI extends StatefulWidget {
  const EntryPointUI({
    super.key,
    this.backButton,
  });

  final Widget? backButton;
  @override
  EntryPointUIState createState() => EntryPointUIState();
}

class EntryPointUIState extends State<EntryPointUI> {
  late List<Widget> _allScreen = [];

  @override
  void initState() {
    super.initState();
    _allScreen = [
      HomePage(backButton: widget.backButton),
      const CartPage(),
      const FavouritePage(),
      const ProfilePage(),
    ];
  }

  int _currentIndex = 0;

  void updateMenu(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.withOpacity(0.10),
      /// Returns Page With Animation
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation, secondAnimation) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: _allScreen[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateMenu,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 28,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: const Color.fromARGB(223, 223, 192, 18),
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(_currentIndex == 0 ? IconlyBold.home : IconlyLight.home),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(_currentIndex == 1 ? IconlyBold.buy : IconlyLight.buy),
          ),
          BottomNavigationBarItem(
            label: "",
            icon:
                Icon(_currentIndex == 2 ? IconlyBold.heart : IconlyLight.heart),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
                _currentIndex == 3 ? IconlyBold.profile : IconlyLight.profile),
          ),
        ],
      ),
    );
  }
}
