import 'package:flutter/material.dart';
import 'package:wander_animation/gen/assets.gen.dart';

import '../widgets/main_trip_card.dart';
import '../widgets/trip_small_cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage(Assets.images.ellipse36.path),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Container(
                margin: const EdgeInsets.only(left: 16),
                child: Text(
                  'Your trips',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Current trip'.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const MainTripCard(),
              const SizedBox(height: 32),
              const TripSmallCard(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
