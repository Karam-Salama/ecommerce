import 'package:ecommerce_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../widgets/custom_welcome_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomWelcomeBody(),
              const SizedBox(height: 234),
              CustomButton(text: AppStrings.getStarted),
              const SizedBox(height: 41),
            ],
          ),
        ),
      ),
    );
  }
}
