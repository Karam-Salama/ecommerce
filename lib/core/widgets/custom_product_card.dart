import 'package:flutter/material.dart';

import '../../features/home/presentation/models/product_model.dart';
import '../../features/home/presentation/views/product_details_view.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class ProductCard extends StatefulWidget {
  final ProductModel productModel;
  final Function()? onFavoriteToggle;

  const ProductCard({
    super.key,
    required this.productModel,
    this.onFavoriteToggle,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    if (widget.onFavoriteToggle != null) {
      widget.onFavoriteToggle!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDetailsView(productModel: widget.productModel),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: AppColors.backgroundColor,
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Product Image
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(widget.productModel.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // Favorite Icon at the top-right corner
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: toggleFavorite,
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_outline,
                        color: isFavorite
                            ? AppColors.redColor
                            : AppColors.primaryColor,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              // Product Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  widget.productModel.title,
                  style: AppTextStyle.lato16style,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 6.0),
              // Price and Discount
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  '\$${widget.productModel.price.toStringAsFixed(2)}',
                  style: AppTextStyle.lato16style.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              // Rating and Review Count
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4.0),
                    Text(
                      widget.productModel.rating.rate.toStringAsFixed(1),
                      style: AppTextStyle.lato16style.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      '(${widget.productModel.rating.count})',
                      style: AppTextStyle.lato16style.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
