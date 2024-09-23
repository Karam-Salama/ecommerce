// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/category_model.dart';
import 'custom_home_category_card.dart';

class CustomCategoryListView extends StatelessWidget {
  CustomCategoryListView({super.key});
  List<CategoryModel> categories = [
    CategoryModel(
        name: AppStrings.electronics, image: Assets.assetsImagesCategoriesElectroincs),
    CategoryModel(
        name: AppStrings.mensClothing, image: Assets.assetsImagesCategoriesMensclothes),
    CategoryModel(
        name: AppStrings.jewelery, image: Assets.assetsImagesCategoriesJewelery),
    CategoryModel(
        name: AppStrings.womensClothing, image: Assets.assetsImagesCategoriesWomensclothes),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16);
        },
        itemBuilder: (_, index) {
          return CustomCategoryCard(
            categoryModel: categories[index],
          );
        },
      ),
    );
  }
}
