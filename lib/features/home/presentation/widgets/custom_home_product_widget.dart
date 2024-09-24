import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class MyProduct extends StatelessWidget {
  const MyProduct({
    super.key,
    required this.imagePath,
    required this.label,
    required this.originalPrice,
    required this.discountedPrice,
    required this.rating,
    required this.reviewCount,
  });

  final ImageProvider<Object> imagePath;
  final String label;
  final double originalPrice;
  final double discountedPrice;
  final double rating;
  final int reviewCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 294,
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16.0),

          // Product Label
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4.0),

          // Price and Discount
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  '\$$discountedPrice',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  '\$$originalPrice',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4.0),

          // Rating and Reviews
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16.0),
                const SizedBox(width: 4.0),
                Text(
                  '$rating',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4.0),
                Text(
                  '($reviewCount)',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
