import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomHomeAppBarWidget extends StatelessWidget {
  const CustomHomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.appName,
            style: AppTextStyle.lato16style,
          ),
          Text(
            'Have A Nice Day',
            style: AppTextStyle.lato16style,
          ),
        ],
      ),
    );
  }
}
