import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<Positioned> tyres(BoxConstraints constrains) {
  return [
    Positioned(
      top: constrains.maxHeight * 0.2,
      left: constrains.maxWidth * 0.22,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      top: constrains.maxHeight * 0.2,
      right: constrains.maxWidth * 0.22,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      top: constrains.maxHeight * 0.63,
      right: constrains.maxWidth * 0.22,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
    Positioned(
      top: constrains.maxHeight * 0.63,
      left: constrains.maxWidth * 0.22,
      child: SvgPicture.asset("assets/icons/FL_Tyre.svg"),
    ),
  ];
}
