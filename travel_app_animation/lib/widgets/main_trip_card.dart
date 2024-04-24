import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../pages/trip_details_page.dart';
import 'home_trip_card_lg.dart';
import 'stacked_row.dart';

class MainTripCard extends StatelessWidget {
  const MainTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              reverseTransitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (_, animation, ___) {
                return TripDetailsPage(animation: animation);
              },
              transitionsBuilder: (_, animation, __, child) => FadeTransition(
                opacity: animation,
                child: child,
              ),
            ),
          ),
          child: const HomeTripCardLg(),
        ),
        Positioned(
          bottom: -20,
          left: 20,
          child: StackedRow(
            items: [
              Assets.images.ellipse36.path,
              Assets.images.ellipse39.path,
              Assets.images.ellipse37.path,
            ]
                .map(
                  (e) => Hero(
                    tag: e,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(e),
                    ),
                  ),
                )
                .toList(),
            size: 42,
            direction: TextDirection.rtl,
            xShift: 10,
          ),
        )
      ],
    );
  }
}
