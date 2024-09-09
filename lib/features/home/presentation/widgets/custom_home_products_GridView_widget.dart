// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import 'custom_home_product_widget.dart';

class HomeProductsGridView extends StatelessWidget {
  const HomeProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return MyProduct(
          imagePath: AssetImage(products[index]['image']!),
          label: products[index]['label']!,
          originalPrice: products[index]['originalPrice']!,
          discountedPrice: products[index]['discountedPrice']!,
          rating: products[index]['rating']!,
          reviewCount: products[index]['reviewCount']!,
        );
      },
    );
  }
}

final List<Map<String, dynamic>> products = [
  {
    'image': Assets.assetsImagesProductsProduct1,
    'label': AppStrings.productName1,
    'originalPrice': 60.0,
    'discountedPrice': 40.0,
    'rating': 4.8,
    'reviewCount': 120,
  },
  {
    'image': Assets.assetsImagesProductsProduct2,
    'label': AppStrings.productName2,
    'originalPrice': 60.0,
    'discountedPrice': 40.0,
    'rating': 4.8,
    'reviewCount': 120,
  },
  {
    'image': Assets.assetsImagesProductsProduct3,
    'label': AppStrings.productName3,
    'originalPrice': 60.0,
    'discountedPrice': 40.0,
    'rating': 4.8,
    'reviewCount': 120,
  },
  {
    'image': Assets.assetsImagesProductsProduct4,
    'label': AppStrings.productName4,
    'originalPrice': 60.0,
    'discountedPrice': 40.0,
    'rating': 4.8,
    'reviewCount': 120,
  },
  {
    'image': Assets.assetsImagesProductsProduct5,
    'label': AppStrings.productName5,
    'originalPrice': 60.0,
    'discountedPrice': 40.0,
    'rating': 4.8,
    'reviewCount': 120,
  },
  {
    'image': Assets.assetsImagesProductsProsuct6,
    'label': AppStrings.productName6,
    'originalPrice': 60.0,
    'discountedPrice': 40.0,
    'rating': 4.8,
    'reviewCount': 120,
  },
];

