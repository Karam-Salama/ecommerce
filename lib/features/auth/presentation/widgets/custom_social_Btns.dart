// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_btn.dart';

class CustomSocialBtns extends StatelessWidget {
  CustomSocialBtns({super.key,this.text1,this.text2});
  String? text1;
  String? text2;

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
          text: text1!,
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
          text: text2!,
          color: AppColors.backgroundColor,
          borderColor: AppColors.primaryColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
