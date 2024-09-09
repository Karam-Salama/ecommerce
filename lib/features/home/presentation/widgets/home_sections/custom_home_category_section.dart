import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_header_text.dart';
import '../custom_home_categories_widget.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      CustomHeaderText(
        text1: AppStrings.categories,
        text2: AppStrings.viewAll,
      ),
      SizedBox(height: 24),
      HomeCategoriesListView(),
      SizedBox(height: 24),
    ]);
  }
}