// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart'; // Import this for TextStyle
import 'package:ecommerce_app/core/utils/app_colors.dart'; // Ensure correct file contains the color definition

abstract class AppTextStyle {
  static final lato30style = const TextStyle(
     fontFamily: 'Lato',
    fontSize: 30,
    color: AppColors.greyColor,
  );

  static const TextStyle lato16style = TextStyle(
    fontFamily: 'Lato',
    fontSize: 15,
    color: AppColors.greyColor,
  );

  static const TextStyle lato15style = TextStyle(
    fontFamily: 'Lato',
    fontSize: 16,
    color: AppColors.primaryColor,
  );
}
