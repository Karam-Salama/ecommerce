import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import 'custom_home_categories_item_widget.dart';

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        itemBuilder: (_, index) {
          return HomeCategoryItem(
            imagePath: categories[index]['image']!,
            label: categories[index]['label']!,
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}

final List<Map<String, String>> categories = [
  {'image': Assets.assetsImagesCategoriesFashion, 'label': AppStrings.fashion},
  {'image': Assets.assetsImagesCategoriesFitness, 'label': AppStrings.fitness},
  {'image': Assets.assetsImagesCategoriesLiving, 'label': AppStrings.living},
  {'image': Assets.assetsImagesCategoriesGame, 'label': AppStrings.games},
  {
    'image': Assets.assetsImagesCategoriesStationery,
    'label': AppStrings.stationery
  },
  {'image': Assets.assetsImagesCategoriesBeauty, 'label': AppStrings.beauty},
];
