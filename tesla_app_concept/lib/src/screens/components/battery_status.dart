import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({
    super.key,
    required this.constrains,
  });

  final BoxConstraints constrains;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: constrains.maxHeight,
      width: constrains.maxWidth,
      child: Column(
        children: [
          Text(
            "220 mi",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.white),
          ),
          Text(
            "62%",
            style: TextStyle(fontSize: 24),
          ),
          Spacer(),
          Text(
            "CHARGING",
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            "18 min remaining",
            style: const TextStyle(fontSize: 20),
          ),
          SizedBox(height: constrains.maxHeight * 0.14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("22 mi/hr"),
                  Text("232 v"),
                ],
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
