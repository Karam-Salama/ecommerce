import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/category_item_model.dart';

class HomeCategoryListViewItem extends StatelessWidget {
  final CategoryItemModel model;

  const HomeCategoryListViewItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("========================================${model.image}");
    }

    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          //padding: const EdgeInsets.all(15.0),
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
          child: Image.network(
            model.image,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
        ),
        const SizedBox(height: 8),
        Text(model.name, style: AppTextStyle.lato16style),
      ],
    );
  }
}
