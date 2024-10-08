import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
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
            const SliverToBoxAdapter(child: SizedBox(height: 60)),
            const SliverToBoxAdapter(
              child: CustomHeaderWidget(
                text: AppStrings.loginWithEmail,
                alignment: Alignment.topLeft,
                textStyle: AppTextStyle.lato16style,
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 58)),
            const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomLoginForm(),
            )),
            SliverToBoxAdapter(
              child: HaveAccountWidget(
                textPart1: AppStrings.dontHaveAccount,
                textPart2: AppStrings.signup,
                onPress: () {
                  customReplacementNavigate(context, '/signUpDefault');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
