import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class UserChips extends StatelessWidget {
  const UserChips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        (name: 'Anne', imagePath: Assets.images.ellipse36.path),
        (name: 'Mike', imagePath: Assets.images.ellipse39.path),
        (name: 'Sophia', imagePath: Assets.images.ellipse37.path),
      ]
          .map(
            (e) => Container(
              margin: const EdgeInsets.only(right: 4),
              child: Hero(
                tag: e.imagePath,
                child: Material(
                  type: MaterialType.transparency,
                  child: Chip(
                    backgroundColor: Colors.grey[800],
                    shape: const StadiumBorder(
                      side: BorderSide(
                          // color: Color.lerp(Colors.red, Colors.black26, height) ?? Colors.transparent,
                          ),
                    ),
                    side: const BorderSide(color: Colors.transparent),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        e.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
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
    );
  }
}
