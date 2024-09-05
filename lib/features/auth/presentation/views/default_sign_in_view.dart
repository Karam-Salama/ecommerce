import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../widgets/custom_header_widget.dart';
import '../widgets/cutom_textField.dart';

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
                textStyle: AppTextStyle.lato16style,
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
