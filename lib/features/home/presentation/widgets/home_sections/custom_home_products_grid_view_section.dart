import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_header_text.dart';
import '../custom_home_products_GridView_widget.dart';

class HomeProductsGridViewSection extends StatelessWidget {
  const HomeProductsGridViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomHeaderText(
          text1: AppStrings.hotDeals,
          text2: AppStrings.viewAll,
        ),
        SizedBox(height: 24),
        HomeProductsGridView(),
      ],
    );
  }
}