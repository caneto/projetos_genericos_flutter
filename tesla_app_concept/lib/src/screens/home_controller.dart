import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int selectedTab = 0;

  onBottomNavigationTabChage(int index) {
    selectedTab = index;
    notifyListeners();
  }

  bool leftDoorLock = true;
  bool rightDoorLock = true;
  bool trunkLock = true;
  bool bonnetLock = true;

  void chnageLeftDoorLock() {
    leftDoorLock = !leftDoorLock;
    notifyListeners();
  }

  void chnageRightDoorLock() {
    rightDoorLock = !rightDoorLock;
    notifyListeners();
  }

  void chnagetrunkLock() {
    trunkLock = !trunkLock;
    notifyListeners();
  }

  void chnageBonnetLock() {
    bonnetLock = !bonnetLock;
    notifyListeners();
  }

  bool isCoolSelected = true;

  void updateTempTab() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }

  int coolTem = 20;
  void coolTemHandler(isIncremt) {
    isIncremt ? coolTem++ : coolTem--;
    notifyListeners();
  }

  bool isShowTyre = false;

  void showTyreHadaler(int index) {
    if (selectedTab == 3 && index != 3)
      isShowTyre = false;
    else if (selectedTab != 3 && index == 3)
      Future.delayed(Duration(milliseconds: 400), () {
        isShowTyre = true;
      });
  }
}
