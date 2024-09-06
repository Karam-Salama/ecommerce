import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../widgets/custom_have_account_widget.dart';
import '../widgets/custom_header_widget.dart';
import '../widgets/custom_signUp_form.dart';

class DefaultSignUpView extends StatelessWidget {
  const DefaultSignUpView({super.key});

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
                  textStyle: AppTextStyle.lato16style,
                  padding: EdgeInsets.symmetric(horizontal: 0)),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 58)),
            const SliverToBoxAdapter(child: CustomSignUpForm()),
            const SliverToBoxAdapter(child: SizedBox(height: 48)),
            SliverToBoxAdapter(
              child: HaveAccountWidget(
                  textPart1: AppStrings.alreadyHaveAccount,
                  textPart2: AppStrings.login,
                  onPress: () {
                    customReplacementNavigate(context, '/login');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
