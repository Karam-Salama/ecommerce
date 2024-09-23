// ignore_for_file: must_be_immutable

import 'package:ecommerce_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_header_text.dart';
import '../widgets/custom_home_banner_widget.dart';
import '../widgets/custom_home_category_listView_widget.dart';
import '../widgets/custom_home_products_gridView_builder_widget.dart';
import '../widgets/custom_home_search_bar_wiget.dart';
import '../widgets/custom_home_app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 60)),
          const SliverToBoxAdapter(child: CustomHomeAppBarWidget()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          const SliverToBoxAdapter(child: CustomSearchBar()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: CustomCategoryListView()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          const SliverToBoxAdapter(child: HomeBannerWidget()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          const SliverToBoxAdapter(
              child: CustomHeaderText(
                  text1: AppStrings.hotDeals, text2: AppStrings.viewAll)),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          const ProductsGridViewBuilder(),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
