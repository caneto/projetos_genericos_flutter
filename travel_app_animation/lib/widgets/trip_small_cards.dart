import 'package:flutter/material.dart';

import 'home_trip_card.dart';

class TripSmallCard extends StatelessWidget {
  const TripSmallCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: 220,
      ),
      shrinkWrap: true,
      children: const [
        HomeTripCard(
          imagePath:
              'https://images.pexels.com/photos/2377432/pexels-photo-2377432.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          date: 'Mar 7-21',
          title: 'Road trips over Italian Riviera',
        ),
        HomeTripCard(
          imagePath:
              'https://images.pexels.com/photos/1615807/pexels-photo-1615807.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          date: 'Jan 7-23',
          title: 'Weekend in Lisbon',
        ),
        HomeTripCard(
          imagePath:
              'https://images.pexels.com/photos/1559908/pexels-photo-1559908.jpeg?auto=compress&cs=tinysrgb&w=600',
          date: 'Mar 7-21',
          title: 'Road trips over Italian Riviera',
        ),
        HomeTripCard(
          imagePath:
              'https://images.pexels.com/photos/1550348/pexels-photo-1550348.jpeg?auto=compress&cs=tinysrgb&w=600',
          date: 'Mar 7-21',
          title: 'Road trips over Italian Riviera',
        )
      ],
    );
  }
}