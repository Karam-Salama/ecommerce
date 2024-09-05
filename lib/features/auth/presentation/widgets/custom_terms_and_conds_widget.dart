import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'custom_checkBox_widget.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomCheckBox(),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: AppStrings.agreeWith, style: AppTextStyle.lato16style),
          TextSpan(text: AppStrings.terms, style: AppTextStyle.lato15style),
        ])),
      ],
    );
  }
}