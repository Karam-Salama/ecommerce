import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class ForgetPasswordSubtitleWidget extends StatelessWidget {
  const ForgetPasswordSubtitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppStrings.forgotPasswordScreenSubTitle,
      style: AppTextStyle.lato16style,
      textAlign: TextAlign.start,
    );
  }
}