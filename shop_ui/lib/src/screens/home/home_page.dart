import 'package:clothing_app/src/screens/home/components/search_bar_componnent.dart';
import 'package:flutter/material.dart';

import '../../constants/app_defaults.dart';
import 'components/categories_list.dart';
import 'components/home_header.dart';
import 'components/home_new_arrival_section.dart';
import 'components/title_and_subtitle.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    this.backButton,
  });

  final Widget? backButton;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(backButton: backButton),
            const SizedBox(height: AppDefaults.margin / 2),
            const TitleAndSubtitle(),
            const SizedBox(height: AppDefaults.margin / 2),
            const SearchBarComponent(),
            const SizedBox(height: AppDefaults.margin / 2),
            const CategoriesList(),
            const SizedBox(height: AppDefaults.margin / 2),
            const NewArrivalSection(),
          ],
        ),
      ),
    );
  }
}
