
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_product_card.dart';
import '../models/product_model.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductModel> productsList;

  const ProductsGridView({super.key, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 310,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ProductCard(
            productModel: productsList[index],
          );
        },
        childCount: productsList.length,
      ),
    );
  }
}