import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({
    super.key,
    required this.isDoorLock,
    required this.press,
  });

  final bool isDoorLock;
  final VoidCallback press;

  Widget doorLock() {
    return isDoorLock
        ? SvgPicture.asset(
            "assets/icons/door_lock.svg",
            key: ValueKey("lock"),
          )
        : SvgPicture.asset(
            "assets/icons/door_unlock.svg",
            key: ValueKey("unlock"),
          );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeInOutBack,
        duration: Duration(milliseconds: 300),
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        child: doorLock(),
      ),
    );
  }
}