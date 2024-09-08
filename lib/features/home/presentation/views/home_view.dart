import 'package:flutter/material.dart';

import 'package:ecommerce_app/core/utils/app_strings.dart';
import '../../../../core/widgets/custom_header_text.dart';
import '../widgets/custom_home_app_bar_widget.dart';
import '../widgets/custom_home_banner_widget.dart';
import '../widgets/custom_home_categories_widget.dart';
import '../widgets/custom_home_products_GridView_widget.dart';
import '../widgets/custom_home_search_bar_wiget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(child: CustomHomeAppBarWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(child: CustomSearchBar()),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: CustomHeaderText(
                text1: AppStrings.categories,
                text2: AppStrings.viewAll,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(child: HomeCategoriesListView()),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(child: HomeBannerWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: CustomHeaderText(
                text1: AppStrings.hotDeals,
                text2: AppStrings.viewAll,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(child: HomeProductsGridView()),
          ],
        ),
      ),
    );
  }
}
