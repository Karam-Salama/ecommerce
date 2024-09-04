import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomOrDivider extends StatelessWidget {
  const CustomOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1.0,
            color: AppColors.orColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            AppStrings.or,
            style: CustomTextStyles.lato16style,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1.0,
            color: AppColors.orColor,
          ),
        ),
      ],
    );
  }
}
