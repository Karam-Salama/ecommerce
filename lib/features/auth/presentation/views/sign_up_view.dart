import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../widgets/custom_have_account_widget.dart';
import '../widgets/custom_header_widget.dart';
import '../widgets/custom_or_wiget.dart';
import '../widgets/custom_social_Btns.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CustomHeaderWidget(
                text: AppStrings.signUpToStarShop,
                alignment: Alignment.topLeft,
                textStyle: AppTextStyle.lato16style,
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
              const SizedBox(height: 69),
              CustomSocialBtns(
                text1: AppStrings.signUpWithGoogle,
                text2: AppStrings.signUpWithApple,
              ),
              const SizedBox(height: 48),
              const CustomOrDivider(),
              const SizedBox(height: 48),
              CustomButton(
                  text: AppStrings.signUpWithEmail,
                  onPressed: () {
                    customReplacementNavigate(context, '/signUpDefault');
                  }),
              const Spacer(),
              HaveAccountWidget(
                  textPart1: AppStrings.alreadyHaveAccount,
                  textPart2: AppStrings.login,
                  onPress: () {
                    customReplacementNavigate(context, '/login');
                  }),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
