import 'package:flutter/material.dart';

import '../../services/get_all_products_services.dart';
import '../models/product_model.dart';
import 'custom_home_products_gridView_widget.dart';

class ProductsGridViewBuilder extends StatefulWidget {
  const ProductsGridViewBuilder({super.key});

  @override
  State<ProductsGridViewBuilder> createState() =>
      _ProductsGridViewBuilderState();
}

class _ProductsGridViewBuilderState extends State<ProductsGridViewBuilder> {
  Future<List<ProductModel>>? future;

  @override
  void initState() {
    super.initState();
    future = AllProductsServices()
        .getAllProducts(url: 'https://fakestoreapi.com/products');
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
