import 'package:flutter/material.dart';
import 'package:wander_animation/gen/assets.gen.dart';
import 'package:wander_animation/models/trip_data.dart';
import 'package:wander_animation/widgets/trip_data_card.dart';

import 'message_row.dart';

class TripDetailsPageViewItem extends StatelessWidget {
  TripDetailsPageViewItem({super.key});

  final tripData = [
    const TripData(
      title: 'Geo Summary',
      imagePath:
          'https://images.pexels.com/photos/2678301/pexels-photo-2678301.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      tripAdditionalInfos: [(title: 'Over 11 days', number: '1,457 km')],
    ),
    const TripData(
      title: 'Media',
      imagePath:
          'https://images.pexels.com/photos/3733269/pexels-photo-3733269.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      tripAdditionalInfos: [
        (title: 'Photos', number: '257'),
        (title: 'Videos', number: '14'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 200),
            SizedBox(
              height: 250,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                scrollDirection: Axis.horizontal,
                itemCount: tripData.length,
                itemBuilder: (context, index) =>
                    TripDataCard(tripData: tripData[index]),
              ),
            ),
            const SizedBox(height: 16),
            const Text('TRIP BOARD', style: TextStyle()),
            const SizedBox(height: 8),
            MessageRow(
                message:
                    'What a trip! Thanks for all the memories! Whats next?',
                imagePath: Assets.images.ellipse53.path),
            const SizedBox(height: 12),
            MessageRow(
                message:
                    "Folk, that was fun. Next time with better car, not that piece of shit!\nHaha.",
                imagePath: Assets.images.ellipse37.path),
          ],
        ),
      ),
    );
  }
}
