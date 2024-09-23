// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../models/category_model.dart';
import '../views/home_category_view.dart';

class CustomCategoryCard extends StatelessWidget {
  CustomCategoryCard({super.key, required this.categoryModel});
  CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return HomeCategoryView(
                category: categoryModel.name,
              );
            },
          ),
        );
      },
      child: Container(
        width: 185,
        height: 96,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.blackColor),
          image: DecorationImage(
            image: AssetImage(
              categoryModel.image,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Text(
            categoryModel.name,
            style: AppTextStyle.lato15style.copyWith(
              fontSize: 18,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
