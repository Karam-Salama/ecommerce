import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_have_account_widget.dart';
import '../widgets/custom_header_widget.dart';
import '../widgets/custom_or_wiget.dart';
import '../widgets/custom_social_Btns.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                text: AppStrings.loginToStarShop,
                alignment: Alignment.topLeft,
                textStyle: AppTextStyle.lato16style,
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
              const SizedBox(height: 69),
              CustomSocialBtns(
                  text1: AppStrings.loginWithGoogle,
                  text2: AppStrings.loginWithApple),
              const SizedBox(height: 48),
              const CustomOrDivider(),
              const SizedBox(height: 48),
              CustomButton(
                  text: AppStrings.loginWithEmail,
                  onPressed: () {
                    customReplacementNavigate(context, '/loginDefault');
                  }),
              const Spacer(),
              HaveAccountWidget(
                textPart1: AppStrings.dontHaveAccount,
                textPart2: AppStrings.signup,
                onPress: () {
                  customReplacementNavigate(context, '/signUp');
                },
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
