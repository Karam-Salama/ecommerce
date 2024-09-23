import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetailsView({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Product Details",
          style: AppTextStyle.lato16style.copyWith(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      productModel.image,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // Product Title
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              child: Text(
                productModel.title,
                style: AppTextStyle.lato16style,
              ),
            ),
            // Price and Rating Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${productModel.price}",
                    style: AppTextStyle.lato16style,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.primaryColor),
                      const SizedBox(width: 5),
                      Text(productModel.rating.rate.toString()),
                      const SizedBox(width: 5),
                      Text("(${productModel.rating.count})"),
                    ],
                  ),
                ],
              ),
            ),
            // Section Header: "Product Details"
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              child: Text(
                "Product Details",
                style: AppTextStyle.lato16style.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            // Product Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                productModel.description,
                style: AppTextStyle.lato16style,
              ),
            ),
            const SizedBox(height: 80),
            // Add To Cart Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomButton(
                onPressed: () {},
                text: 'Add To Cart',
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
