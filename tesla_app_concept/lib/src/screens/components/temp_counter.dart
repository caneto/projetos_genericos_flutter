import 'package:flutter/material.dart';

class TempCounter extends StatelessWidget {
  const TempCounter({
    super.key,
    required this.temperature,
    required this.pressIncrement,
    required this.pressDecrement,
  });

  final int temperature;
  final VoidCallback pressIncrement, pressDecrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: pressIncrement,
          icon: Icon(
            Icons.arrow_drop_up,
            size: 48,
          ),
        ),
        Text(
          temperature.toString() + "\u2103",
          style: TextStyle(fontSize: 86),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: pressDecrement,
          icon: Icon(
            Icons.arrow_drop_down,
            size: 48,
          ),
        ),
      ],
    );
  }
}