import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_btn.dart';

class CustomSocialBtns extends StatelessWidget {
  const CustomSocialBtns({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          icon: const Icon(
            Icons.g_mobiledata_rounded,
            color: AppColors.primaryColor,
            size: 25,
          ),
          text: AppStrings.loginWithGoogle,
          color: AppColors.backgroundColor,
          borderColor: AppColors.primaryColor,
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        CustomButton(
          icon: const Icon(
            Icons.apple_rounded,
            color: AppColors.primaryColor,
            size: 25,
          ),
          text: AppStrings.loginWithApple,
          color: AppColors.backgroundColor,
          borderColor: AppColors.primaryColor,
          onPressed: () {},
        ),
      ],
    );
  }
}