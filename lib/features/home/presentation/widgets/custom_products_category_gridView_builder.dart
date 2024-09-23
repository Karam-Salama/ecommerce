
import 'package:flutter/material.dart';

import '../../services/get_products_by_category_name_service.dart';
import '../models/product_model.dart';
import 'custom_home_products_gridView_widget.dart';

class ProductsCategoryGridViewBuilder extends StatefulWidget {
  const ProductsCategoryGridViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<ProductsCategoryGridViewBuilder> createState() =>
      _ProductsCategoryGridViewBuilderState();
}

class _ProductsCategoryGridViewBuilderState
    extends State<ProductsCategoryGridViewBuilder> {
  Future<List<ProductModel>>? future;

  @override
  void initState() {
    super.initState();
    future = ProductsByCategoryNameServices()
        .getProductsByCategories(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading state
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          // Success state
          return ProductsGridView(productsList: snapshot.data!);
        } else if (snapshot.hasError) {
          // Error state
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('Oops! there was an error, try again later!'),
            ),
          );
        } else {
          // Default (empty) state
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('No products available.'),
            ),
          );
        }
      },
    );
  }
}
