import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../components/network_image.dart';
import '../../constants/app_defaults.dart';
import 'components/color_picker.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
    this.isFavourite = false,
    required this.coverImage,
  });

  final bool isFavourite;
  final String coverImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              isFavourite ? IconlyBold.heart : IconlyLight.heart,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            ProductImage(imageLink: coverImage),
            const ProductDescription(),
          ],
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDefaults.radius),
          topRight: Radius.circular(AppDefaults.radius),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          // Title And Pricing
          Padding(
            padding: const EdgeInsets.all(AppDefaults.padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Casual Henley Shirts',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '\$175',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          // Description
          Padding(
            padding: const EdgeInsets.all(AppDefaults.padding),
            child: Text(
              "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2-5 buttons.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          // Color Choosers
          const ColorPicker(),
          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Add To Cart'),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.imageLink,
  });
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Hero(
          tag: imageLink,
          child: NetworkImageWithLoader(
            imageLink,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
