import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class WelcomeSubtitle extends StatelessWidget {
  const WelcomeSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      AppStrings.welcomeSubTitle,
      style: AppTextStyle.lato16style,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
