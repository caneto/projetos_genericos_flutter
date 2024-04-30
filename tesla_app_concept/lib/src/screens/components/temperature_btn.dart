import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';

class TemperatureBtn extends StatelessWidget {
  const TemperatureBtn({
    super.key,
    required this.svgSrc,
    required this.text,
    required this.press,
    this.isActive = false,
    this.activeColor = primaryColor,
  });

  final String svgSrc, text;
  final VoidCallback press;
  final bool isActive;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          AnimatedContainer(
            curve: Curves.easeInOutBack,
            duration: Duration(milliseconds: 200),
            height: isActive ? 76 : 50,
            width: isActive ? 76 : 50,
            child: SvgPicture.asset(
              svgSrc,
              colorFilter: ColorFilter.mode(isActive ? activeColor : Colors.white38, BlendMode.srcIn),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
                color: isActive ? activeColor : Colors.white38,
                fontSize: 16,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
            child: Text(
              text.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
