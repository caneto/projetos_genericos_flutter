import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class DetailsBackground extends StatelessWidget {
  const DetailsBackground({
    super.key,
    required this.offset,
  });

  final double offset;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Hero(
        tag: 'bg',
        child: FadeTransition(
          opacity: AlwaysStoppedAnimation(1 - offset),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Assets.images.pexelsTraceHudson2724664.path,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
