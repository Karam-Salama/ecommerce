import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'custom_header_widget.dart';

class ForgetPasswordTitle extends StatelessWidget {
  const ForgetPasswordTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomHeaderWidget(
      text: AppStrings.forgotPassword,
      alignment: Alignment.topLeft,
      textStyle: AppTextStyle.lato16style,
      padding: EdgeInsets.symmetric(horizontal: 0),
    );
  }
}