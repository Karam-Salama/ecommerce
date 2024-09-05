import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../widgets/custom_header_widget.dart';
import '../widgets/custom_signUp_form.dart';

class DefaultSignUpView extends StatelessWidget {
  const DefaultSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: CustomHeaderWidget(
                  text: AppStrings.signUpWithEmail,
                  alignment: Alignment.topLeft,
                  textStyle: AppTextStyle.lato16style,
                  padding: EdgeInsets.symmetric(horizontal: 0)),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 58)),
            SliverToBoxAdapter(child: CustomSignUpForm()),
          ],
        ),
      ),
    );
  }
}
