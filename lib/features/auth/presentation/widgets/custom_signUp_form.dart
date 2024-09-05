import 'package:ecommerce_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_btn.dart';
import 'custom_terms_and_conds_widget.dart';
import 'cutom_textField.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.email,
                hintText: AppStrings.enterEmail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (email) {
                  BlocProvider.of<AuthCubit>(context).emailAddress = email;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                labelText: AppStrings.password,
                hintText: AppStrings.enterPassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                suffixIcon:
                    const Icon(Icons.visibility, color: AppColors.greyColor),
                onChanged: (password) {
                  BlocProvider.of<AuthCubit>(context).password = password;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                labelText: AppStrings.confirmPassword,
                hintText: AppStrings.enterPassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                suffixIcon:
                    const Icon(Icons.visibility, color: AppColors.greyColor),
                onChanged: (confirmPassword) {
                  BlocProvider.of<AuthCubit>(context).confirmPassword =
                      confirmPassword;
                },
              ),
              const SizedBox(height: 16),
              const TermsAndConditionsWidget(),
              const SizedBox(height: 48),
              CustomButton(
                  text: AppStrings.signup,
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context)
                        .signUpWithEmailAndPassword();
                  }),
            ],
          ),
        );
      },
    );
  }
}
