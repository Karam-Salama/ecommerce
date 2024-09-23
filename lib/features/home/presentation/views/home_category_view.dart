import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../widgets/custom_products_category_gridView_builder.dart';

class HomeCategoryView extends StatelessWidget {
  const HomeCategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: true,
        title: Text(category,
            style: AppTextStyle.lato16style.copyWith(fontSize: 20)),
      ),
      body: CustomScrollView(
        slivers: [
          ProductsCategoryGridViewBuilder(category: category),
        ],
      ),
    );
  }
}
