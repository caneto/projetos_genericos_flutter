import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  final String title;
  final String text;
  
  const MyRow({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7, bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black54),
          ),
          Text(text),
        ],
      ),
    );
  }
}
