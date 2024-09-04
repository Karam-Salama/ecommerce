import 'package:ecommerce_app/core/functions/navigation.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_strings.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_have_account_widget.dart';
import '../widgets/custom_header_widget.dart';
import '../widgets/custom_or_wiget.dart';
import '../widgets/custom_social_Btns.dart';
import '../widgets/cutom_textField.dart';

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
                textStyle: CustomTextStyles.lato16style,
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
              const SizedBox(height: 69),
              const CustomSocialBtns(),
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
                onPress: () {},
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLoginDefault extends StatelessWidget {
  const CustomLoginDefault({super.key});

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
                text: AppStrings.loginWithEmail,
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
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            const SliverToBoxAdapter(
              child: CustomHeaderWidget(
                text: AppStrings.forgotPassword,
                alignment: Alignment.centerRight,
                textStyle: CustomTextStyles.lato16style,
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 48)),
            SliverToBoxAdapter(
                child: CustomButton(text: AppStrings.login, onPressed: () {})),
          ],
        ),
      ),
    );
  }
}



class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
