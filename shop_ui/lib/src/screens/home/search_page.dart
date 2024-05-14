import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../components/product_tile_square.dart';
import '../../constants/constants.dart';
import 'components/home_header.dart';
import 'components/search_bar_componnent.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key, required this.searchedValue});

  final String searchedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeader(),
          const SizedBox(height: AppDefaults.margin / 2),
          const SearchBarComponent(),
          const RecentSearchesButton(),
          const Divider(),
          const SizedBox(height: AppDefaults.margin / 2),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDefaults.padding * 1.5),
            child: Text(
              'Search results showing for "$searchedValue"',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SearchedProductsList(),
        ],
      ),
    );
  }
}

class SearchedProductsList extends StatelessWidget {
  const SearchedProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// We are putting this here just for the sake of simplicity, and this is
    /// just for mockup..
    /// You shouldn't use or write any logic or keep your data here,
    /// this is bad for your app if you fetch or put any data here
    List<Widget> foundProducts = const [
      ProductTileSquare(
        title: 'Long Sleeve Shirts',
        price: 165,
        imageLink: 'https://i.imgur.com/QVroKWd.png',
        hasFavourite: true,
        isFavourite: true,
      ),
      ProductTileSquare(
        title: 'Casual Henley Shirts',
        price: 175,
        imageLink: 'https://i.imgur.com/PFBRThN.png',
        hasFavourite: true,
      ),
      ProductTileSquare(
        title: 'Curved Hem Shirts',
        price: 100,
        imageLink: 'https://i.imgur.com/8dNDjHk.png',
        hasFavourite: true,
      ),
      ProductTileSquare(
        title: 'Casual Nolin',
        price: 100,
        imageLink: 'https://i.imgur.com/KexwuK9.png',
        hasFavourite: true,
      ),
      ProductTileSquare(
        title: 'Casual Nolin',
        price: 100,
        imageLink: 'https://i.imgur.com/fDwKPuo.png',
        hasFavourite: true,
      ),
      ProductTileSquare(
        title: 'Casual Nolin',
        price: 100,
        imageLink: 'https://i.imgur.com/sjDVeNV.png',
        hasFavourite: true,
      ),
    ];

    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 290,
        ),
        itemBuilder: (context, index) {
          return foundProducts[index];
        },
        itemCount: foundProducts.length,
      ),
    );
  }
}

/// Text Button With Recent Search
class RecentSearchesButton extends StatelessWidget {
  const RecentSearchesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDefaults.margin),
      child: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Searches',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Icon(
                IconlyLight.arrowRight2,
                color: Colors.grey,
              ),
            ],
          )),
    );
  }
}
