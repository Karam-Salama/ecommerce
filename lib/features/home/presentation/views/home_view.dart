import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../widgets/custom_home_search_bar_wiget.dart';
import '../widgets/custom_home_app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 60)),
          SliverToBoxAdapter(child: CustomHomeAppBarWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: CustomSearchBar()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: CustomCategoriesListView()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: HomeBannerWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: CustomHeaderText(text1: AppStrings.hotDeals, text2: AppStrings.viewAll),),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class CustomCategoriesListView extends StatelessWidget {
  const CustomCategoriesListView({super.key});

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
          return const CustomCategoriesListViewItem();
        },
        itemCount: 6,
      ),
    );
  }
}

class CustomCategoriesListViewItem extends StatelessWidget {
  const CustomCategoriesListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: AppColors.greyColor,
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Image.asset(
            Assets.assetsImagesCategoriesFashion,
            width: 14,
            height: 14,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
        ),
        const SizedBox(height: 8),
        const Text(AppStrings.fashion, style: AppTextStyle.lato16style),
      ],
    );
  }
}

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0), // Maintain the radius here
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.assetsImagesBannersSales,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: -15,
              bottom: 10,
              child: Image.asset(
                Assets.assetsImagesBannersYoungBeautifulGirl,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({super.key, required this.text1, this.text2});
  final String text1;
  final String? text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: AppTextStyle.lato16style,
          ),
          Text(
            text2!,
            style: AppTextStyle.lato16style,
          ),
        ],
      ),
    );
  }
}
