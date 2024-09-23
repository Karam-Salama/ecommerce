
import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({super.key, required this.text1, this.text2, this.textAlign1, this.textAlign2});
  final String text1;
  final String? text2;
  final TextAlign? textAlign1;
  final TextAlign? textAlign2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: AppTextStyle.lato16style,
            textAlign: textAlign1,
          ),
          Text(
            text2!,
            style: AppTextStyle.lato16style,
            textAlign: textAlign2,
          ),
        ],
      ),
    );
  }
}
