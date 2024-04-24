import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../gen/assets.gen.dart';

class HiddenHeader extends StatelessWidget {
  const HiddenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0,
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'May 5-15',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(height: 16),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Text(
                  'Riding through the lands of the legends',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Theme(
            data: ThemeData.dark()
                .copyWith(textTheme: GoogleFonts.montserratTextTheme()),
            child: Wrap(
              children: [
                (name: 'Anne', imagePath: Assets.images.ellipse36.path),
                (name: 'Mike', imagePath: Assets.images.ellipse39.path),
                (name: 'Sophia', imagePath: Assets.images.ellipse37.path),
              ]
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: Material(
                        color: Colors.transparent,
                        child: Theme(
                          data: ThemeData.dark().copyWith(
                              textTheme: GoogleFonts.montserratTextTheme()),
                          child: Chip(
                            label: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(e.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                            ),
                            avatar: CircleAvatar(
                              backgroundImage: AssetImage(e.imagePath),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}