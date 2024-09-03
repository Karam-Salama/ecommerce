import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppStrings.welcomeTitle,
      style: CustomTextStyles.lato30style,
      textAlign: TextAlign.center,
    );
  }
}