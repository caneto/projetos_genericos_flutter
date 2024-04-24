import 'package:flutter/material.dart';

import 'user_chaip.dart';

class DetailsPageHeader extends StatelessWidget {
  const DetailsPageHeader({super.key, required this.offset});

  final double offset;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset(0, 1 - offset),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const TitleSubtitle(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: "date",
                    child: Text(
                      'May 5-15',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color:
                                Color.lerp(Colors.white, Colors.black, offset),
                          ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FractionallySizedBox(
                    widthFactor: 0.7,
                    child: Hero(
                      tag: "title",
                      child: Text(
                        'Riding through the lands of the legends',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Color.lerp(
                                  Colors.white, Colors.black, offset),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const UserChips(),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
