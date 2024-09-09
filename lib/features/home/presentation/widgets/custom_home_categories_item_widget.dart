import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class HomeCategoryListViewItem extends StatelessWidget {
  final String imagePath;
  final String label;

  const HomeCategoryListViewItem({
    super.key,
    required this.imagePath,
    required this.label,
  });

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
            imagePath,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: AppTextStyle.lato16style),
      ],
    );
  }
}
