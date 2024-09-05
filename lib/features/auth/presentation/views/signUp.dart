import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../widgets/custom_have_account_widget.dart';
import '../widgets/custom_header_widget.dart';
import '../widgets/custom_or_wiget.dart';
import '../widgets/custom_social_Btns.dart';
import '../widgets/custom_terms_and_conds_widget.dart';
import '../widgets/cutom_textField.dart';

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
                textStyle: CustomTextStyles.lato16style,
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
              const SizedBox(height: 69),
              CustomSocialBtns(
                  text1: AppStrings.signUpWithGoogle,
                  text2: AppStrings.signUpWithApple),
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

class CustomSignUpDefault extends StatelessWidget {
  const CustomSignUpDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            const SliverToBoxAdapter(
              child: CustomHeaderWidget(
                text: AppStrings.signUpWithEmail,
                alignment: Alignment.topLeft,
                textStyle: CustomTextStyles.lato16style,
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 58)),
            const SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.email,
                hintText: AppStrings.enterEmail,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(
                child: CustomTextField(
              labelText: AppStrings.password,
              hintText: AppStrings.enterPassword,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              suffixIcon: Icon(Icons.visibility, color: AppColors.greyColor),
            )),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(
                child: CustomTextField(
              labelText: AppStrings.confirmPassword,
              hintText: AppStrings.enterPassword,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              suffixIcon: Icon(Icons.visibility, color: AppColors.greyColor),
            )),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(child: TermsAndConditionsWidget()),
            const SliverToBoxAdapter(child: SizedBox(height: 48)),
            SliverToBoxAdapter(
                child: CustomButton(text: AppStrings.signup, onPressed: () {})),
          ],
        ),
      ),
    );
  }
}

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
