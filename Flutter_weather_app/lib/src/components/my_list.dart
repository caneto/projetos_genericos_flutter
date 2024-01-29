import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  final String title;
  final String subTitle;
  final String day;
  final String night;
  final IconData icon;
  final Color iconColor;

  const MyList({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.iconColor,
    required this.day,
    required this.night,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 55,
              color: iconColor,
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  day,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  night,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
