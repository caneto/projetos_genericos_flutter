import 'package:flutter/material.dart';
import 'package:tesla/src/screens/home_controller.dart';

import '../../constants/constants.dart';
import 'temp_counter.dart';
import 'temperature_btn.dart';

class TempDetails extends StatelessWidget {
  TempDetails({
    super.key,
    required this.constrains,
    required this.press,
    required this.isCoolTabSelected,
  });

  final BoxConstraints constrains;
  final VoidCallback press;
  final bool isCoolTabSelected;

  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constrains.maxHeight,
      width: constrains.maxWidth,
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  SizedBox(
                    height: 110,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TemperatureBtn(
                          svgSrc: "assets/icons/coolShape.svg",
                          text: "Cool",
                          press: press,
                          isActive: isCoolTabSelected,
                        ),
                        const SizedBox(width: defaultPadding * 1.5),
                        TemperatureBtn(
                          svgSrc: "assets/icons/heatShape.svg",
                          text: "Heat",
                          press: press,
                          isActive: !isCoolTabSelected,
                          activeColor: redColor,
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 2),
                  TempCounter(
                    temperature: _controller.coolTem,
                    pressDecrement: () => _controller.coolTemHandler(false),
                    pressIncrement: () => _controller.coolTemHandler(true),
                  ),
                  Spacer(flex: 2),
                  Text("CURRENT TEMPERATURE"),
                  const SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Inside".toUpperCase(),
                          ),
                          Text(
                            "20" + "\u2103",
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                      const SizedBox(width: defaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Outside".toUpperCase(),
                            style: TextStyle(color: Colors.white60),
                          ),
                          Text(
                            "35" + "\u2103",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white60),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
