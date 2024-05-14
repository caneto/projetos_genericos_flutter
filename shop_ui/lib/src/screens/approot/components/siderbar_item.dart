import 'package:flutter/material.dart';

import '../../../components/icon_with_background.dart';

class SiderBarItem extends StatelessWidget {
  const SiderBarItem({
    super.key,
    this.onTap,
    required this.name,
    required this.iconData,
    required this.isActive,
  });

  final void Function()? onTap;
  final String name;
  final IconData iconData;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue.withOpacity(0.35),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconWithBackground(iconData: iconData, size: 18),
              const SizedBox(width: 5),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
