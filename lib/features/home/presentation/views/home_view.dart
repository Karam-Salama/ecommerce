import 'package:flutter/material.dart';

import '../widgets/home_sections/custom_home_app_bar_section.dart';
import '../widgets/home_sections/custom_home_banners_section.dart';
import '../widgets/home_sections/custom_home_category_section.dart';
import '../widgets/home_sections/custom_home_products_grid_view_section.dart';
import '../widgets/home_sections/custom_home_search_section.dart';

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
            SliverToBoxAdapter(child: HomeAppBarSection()),
            SliverToBoxAdapter(child: HomeSearchSection()),
            SliverToBoxAdapter(child: HomeCategorySection()),
            SliverToBoxAdapter(child: HomeBannerSection()),
            SliverToBoxAdapter(child: HomeProductsGridViewSection()),
          ],
        ),
      ),
    );
  }
}
