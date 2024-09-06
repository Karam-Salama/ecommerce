import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../widgets/custom_have_account_widget.dart';
import '../widgets/custom_header_widget.dart';
import '../widgets/custom_signIn_form.dart';

class DefaultSignInView extends StatelessWidget {
  const DefaultSignInView({super.key});

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
                textStyle: AppTextStyle.lato16style,
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 58)),
            const SliverToBoxAdapter(child: CustomLoginForm()),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            const SliverToBoxAdapter(
              child: CustomHeaderWidget(
                text: AppStrings.forgotPassword,
                alignment: Alignment.centerRight,
                textStyle: AppTextStyle.lato16style,
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 48)),
            SliverToBoxAdapter(
              child: CustomButton(
                text: AppStrings.login,
                onPressed: () {},
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 48)),
            SliverToBoxAdapter(
              child: HaveAccountWidget(
                textPart1: AppStrings.dontHaveAccount,
                textPart2: AppStrings.signup,
                onPress: () {
                  customReplacementNavigate(context, '/signUp');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
