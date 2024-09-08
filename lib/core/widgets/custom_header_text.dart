import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({super.key, required this.text1, this.text2});
  final String text1;
  final String? text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: AppTextStyle.lato16style,
        ),
        Text(
          text2!,
          style: AppTextStyle.lato16style,
        ),
      ],
    );
  }
}