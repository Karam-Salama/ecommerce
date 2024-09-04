import 'package:flutter/material.dart'; // Import this for TextStyle
import 'package:ecommerce_app/core/utils/app_colors.dart'; // Ensure correct file contains the color definition

abstract class CustomTextStyles {
  // Use TextStyle from flutter/painting.dart or flutter/material.dart
  static const TextStyle lato30style = TextStyle(
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
