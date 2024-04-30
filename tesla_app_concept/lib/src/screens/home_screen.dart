
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/src/constants/constants.dart';
import 'package:tesla/src/screens/home_controller.dart';
import 'package:tesla/src/models/TyrePsi.dart';

import 'components/battery_status.dart';
import 'components/bottom_navigation.dart';
import 'components/door_lock.dart';
import 'components/temp_details.dart';
import 'components/tyres.dart';

class HomeScreen extends StatefulWidget {
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;
  late Animation<double> _animationBatteryStatus;

  late AnimationController _tempAnimationController;
  late Animation<double> _animationCarShift;
  late Animation<double> _animationShowTempInfo;
  late Animation<double> _animationCoolGlow;

  late AnimationController _tyreAnimationController;

  late Animation<double> _animationTyre1Psi;
  late Animation<double> _animationTyre2Psi;
  late Animation<double> _animationTyre3Psi;
  late Animation<double> _animationTyre4Psi;

  void setupBatteryAnimation() {
    _batteryAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _animationBattery = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: Interval(0.0, 0.5),
    );

    _animationBatteryStatus = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: Interval(0.6, 1),
    );
  }

  void setupTemAnimation() {
    _tempAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _animationCarShift = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Interval(0.2, 0.4),
    );
    _animationShowTempInfo = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Interval(0.45, 0.65),
    );
    _animationCoolGlow = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Interval(0.7, 1),
    );
  }

  void setupTyreAnimation() {
    _tyreAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));

    _animationTyre1Psi = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: Interval(0.34, 0.5, curve: Curves.easeOutQuad),
    );
    _animationTyre2Psi = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: Interval(0.5, 0.66, curve: Curves.easeOutQuad),
    );
    _animationTyre3Psi = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: Interval(0.66, 0.82, curve: Curves.easeOutQuad),
    );
    _animationTyre4Psi = CurvedAnimation(
      parent: _tyreAnimationController,
      curve: Interval(0.82, 1, curve: Curves.easeOutQuad),
    );
  }

  final _controller = HomeController();

  @override
  void initState() {
    setupBatteryAnimation();
    setupTemAnimation();
    setupTyreAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    _tempAnimationController.dispose();
    _tyreAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size _size = MediaQuery.of(context).size;
    // int _currentTabIndex = _controller.selectedTab;
    return AnimatedBuilder(
      animation: Listenable.merge(
          [_controller, _batteryAnimationController, _tempAnimationController]),
      builder: (context, _) {
        return Scaffold(
          bottomNavigationBar: TeslaAppBottomNavigation(
            onTap: (index) {
              if (index == 1)
                _batteryAnimationController.forward();
              else if (_controller.selectedTab == 1 && index != 1)
                _batteryAnimationController.reverse(from: 0.7);
              if (index == 2)
                _tempAnimationController.forward();
              else if (_controller.selectedTab == 2 && index != 2)
                _tempAnimationController.reverse(from: 0.4);

              if (index == 3)
                _tyreAnimationController.forward();
              else if (_controller.selectedTab == 3 && index != 3) {
                _tyreAnimationController.reverse();
                // _animationShowTyre.status;
              }

              // if (index == 3) _tempAnimationController.forward();
              _controller.showTyreHadaler(index);
              _controller.onBottomNavigationTabChage(index);
            },
            selectedTab: _controller.selectedTab,
          ),
          body: SafeArea(
            child: SizedBox(
              // height: double.infinity,
              child: LayoutBuilder(
                builder: (context, constrains) {
                  return Stack(
                    alignment: Alignment.center,
                    // fit: StackFit.expand,
                    children: [
                      SizedBox(
                          height: constrains.maxHeight,
                          width: constrains.maxWidth),
                      Positioned(
                        height: constrains.maxHeight,
                        width: constrains.maxWidth,
                        left:
                            constrains.maxWidth / 2 * _animationCarShift.value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constrains.maxHeight * 0.1),
                          child: SvgPicture.asset(
                            "assets/icons/Car.svg",
                            width: double.infinity,
                            // height: constrains.maxHeight * 0.8,
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: defaultDuration,
                        right: _controller.selectedTab == 0
                            ? constrains.maxWidth * 0.05
                            : constrains.maxWidth / 2, //20
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _controller.selectedTab == 0 ? 1 : 0,
                          child: DoorLock(
                            isDoorLock: _controller.rightDoorLock,
                            press: _controller.chnageRightDoorLock,
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: defaultDuration,
                        left: _controller.selectedTab == 0
                            ? constrains.maxWidth * 0.05
                            : constrains.maxWidth / 2,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _controller.selectedTab == 0 ? 1 : 0,
                          child: DoorLock(
                            isDoorLock: _controller.leftDoorLock,
                            press: _controller.chnageLeftDoorLock,
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: defaultDuration,
                        top: _controller.selectedTab == 0
                            ? constrains.maxHeight * 0.13
                            : constrains.maxHeight * 0.4, //20
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _controller.selectedTab == 0 ? 1 : 0,
                          child: DoorLock(
                            isDoorLock: _controller.bonnetLock,
                            press: _controller.chnageBonnetLock,
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: defaultDuration,
                        bottom: _controller.selectedTab == 0
                            ? constrains.maxHeight * 0.17
                            : constrains.maxHeight * 0.4,
                        child: AnimatedOpacity(
                          duration: defaultDuration,
                          opacity: _controller.selectedTab == 0 ? 1 : 0,
                          child: DoorLock(
                            isDoorLock: _controller.trunkLock,
                            press: _controller.chnagetrunkLock,
                          ),
                        ),
                      ),

                      // Battery
                      Positioned(
                        child: Opacity(
                          // duration: defaultDuration,
                          opacity: _animationBattery.value,
                          child: SvgPicture.asset(
                            "assets/icons/Battery.svg",
                            width: constrains.maxWidth * 0.45,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50 * (1 - _animationBatteryStatus.value),
                        child: Opacity(
                          opacity: _animationBatteryStatus.value,
                          // opacity: 1,
                          child: BatteryStatus(constrains: constrains),
                        ),
                      ),

                      // Temp
                      Positioned(
                        top: 40 * (1 - _animationShowTempInfo.value),
                        child: Opacity(
                          opacity: _animationShowTempInfo.value,
                          child: TempDetails(
                            constrains: constrains,
                            press: _controller.updateTempTab,
                            isCoolTabSelected: _controller.isCoolSelected,
                          ),
                        ),
                      ),
                      Positioned(
                        right: -180 * (1 - _animationCoolGlow.value),
                        child: AnimatedSwitcher(
                          duration: defaultDuration,
                          child: _controller.isCoolSelected
                              ? Image.asset(
                                  "assets/images/Cool_glow_2.png",
                                  key: UniqueKey(),
                                  width: 200,
                                )
                              : Image.asset(
                                  "assets/images/Hot_glow_4.png",
                                  key: UniqueKey(),
                                  width: 200,
                                ),
                        ),
                      ),
                      if (_controller.isShowTyre) ...tyres(constrains),
                      GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: defaultPadding,
                          crossAxisSpacing: defaultPadding,
                          childAspectRatio:
                              constrains.maxWidth / constrains.maxHeight,
                        ),
                        children: [
                          ScaleTransition(
                            scale: _animationTyre1Psi,
                            child: TyrePsiCard(tyrePsi: demoPsiList[0]),
                          ),
                          ScaleTransition(
                            scale: _animationTyre2Psi,
                            child: TyrePsiCard(tyrePsi: demoPsiList[1]),
                          ),
                          ScaleTransition(
                            scale: _animationTyre3Psi,
                            child: TyrePsiCard(
                              tyrePsi: demoPsiList[2],
                              isBottomTwoTyre: true,
                            ),
                          ),
                          ScaleTransition(
                            scale: _animationTyre4Psi,
                            child: TyrePsiCard(
                              tyrePsi: demoPsiList[3],
                              isBottomTwoTyre: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard({
    Key? key,
    required this.tyrePsi,
    this.isBottomTwoTyre = false,
  }) : super(key: key);

  final TyrePsi tyrePsi;
  final bool isBottomTwoTyre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color:
            tyrePsi.isLowPressure ? redColor.withOpacity(0.1) : Colors.white10,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        border: Border.all(
            color: tyrePsi.isLowPressure ? redColor : primaryColor, width: 2),
      ),
      child: isBottomTwoTyre
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (tyrePsi.isLowPressure) LowPressureText(),
                Spacer(),
                Text(
                  "${tyrePsi.temp}\u2103",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: defaultPadding),
                PsiText(psi: tyrePsi.psi),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PsiText(psi: tyrePsi.psi),
                const SizedBox(height: defaultPadding),
                Text(
                  "${tyrePsi.temp}\u2103",
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                if (tyrePsi.isLowPressure) LowPressureText(),
              ],
            ),
    );
  }
}

class PsiText extends StatelessWidget {
  const PsiText({
    Key? key,
    required this.psi,
  }) : super(key: key);

  final double psi;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: psi.toString(),
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
        children: [
          TextSpan(
            text: "psi",
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class LowPressureText extends StatelessWidget {
  const LowPressureText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Low".toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          "PRESSURE",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
