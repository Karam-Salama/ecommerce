import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import 'cutom_textField.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Form(
      child: Column(
        children: [
          CustomTextFormField(
            labelText: AppStrings.email,
            hintText: AppStrings.enterEmail,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            labelText: AppStrings.password,
            hintText: AppStrings.enterPassword,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            suffixIcon: Icon(
              Icons.visibility,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
