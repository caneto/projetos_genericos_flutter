import 'package:flutter/material.dart';
import 'package:wander_animation/gen/assets.gen.dart';
import 'package:wander_animation/widgets/trip_details_pageview_item.dart';

import '../widgets/details_page_background.dart';
import '../widgets/details_page_header.dart';

class TripDetailsPage extends StatefulWidget {
  const TripDetailsPage(
      {super.key, this.animation = const AlwaysStoppedAnimation(0)});

  final Animation<double> animation;

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  ValueNotifier<double> offsetNotifier = ValueNotifier(0);
  final PageController _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(_pageListener);
    super.initState();
  }

  void _pageListener() {
    final screenSize = MediaQuery.of(context).size;
    final offsetValue = _pageController.offset / screenSize.height;
    offsetNotifier.value = offsetValue.clamp(0, 1);
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_pageListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: offsetNotifier,
      builder: (context, offsetValue, _) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            forceMaterialTransparency: true,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: IconButton.styleFrom(
                backgroundColor:
                    Color.lerp(Colors.white, Colors.black26, 1 - offsetValue),
              ),
              icon: Icon(
                Icons.close,
                color: Color.lerp(Colors.white, Colors.black, offsetValue),
              ),
            ),
            actions: [
              FadeTransition(
                opacity: AlwaysStoppedAnimation(offsetValue),
                child: IconButton(
                  icon: CircleAvatar(
                    backgroundImage: AssetImage(Assets.images.ellipse36.path),
                  ),
                  onPressed: () {},
                ),
              )
            ],
            backgroundColor: Colors.transparent,
          ),
          body: Stack(
            children: [
              DetailsBackground(offset: offsetValue),
              DetailsPageHeader(offset: offsetValue),
              PageView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox.shrink(),
                  TripDetailsPageViewItem(),
                ],
              ),
              Positioned(
                bottom: 60,
                right: -72.0 * (1 - offsetValue),
                child: FadeTransition(
                  opacity: AlwaysStoppedAnimation(offsetValue),
                  child: Container(
                    height: 40,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent[400],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: const Icon(Icons.edit, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
