import 'package:cherry_toast/cherry_toast.dart';
import 'package:ecommerce_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_btn.dart';
import 'custom_name_fields_row.dart';
import 'custom_terms_and_conds_widget.dart';
import 'cutom_textField.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {
        if (state is SignUpSuccessState) {
          showToast(context, "Successfully, Check Your Email To Verify Your Account");
          Future.delayed(
            const Duration(seconds: 2),
            () {
              customReplacementNavigate(context, '/home');
            },
          );
        } else if (state is SignUpErrorState) {
          showToast(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signUpFormKey,
          child: Column(
            children: [
              CustomNameFieldsRow(
                onFirstNameChanged: (firstName) {
                  authCubit.firstName = firstName;
                },
                onLastNameChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                labelText: AppStrings.email,
                hintText: AppStrings.enterEmail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                labelText: AppStrings.password,
                hintText: AppStrings.enterPassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: authCubit.obscurePasswordTextValue,
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.obscurePasswordTextValue == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.greyColor,
                  ),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                ),
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                labelText: AppStrings.confirmPassword,
                hintText: AppStrings.enterPassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: authCubit.obscurePasswordTextValue,
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.obscurePasswordTextValue == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.greyColor,
                  ),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                ),
                onChanged: (confirmPassword) {
                  authCubit.confirmPassword = confirmPassword;
                },
              ),
              const SizedBox(height: 16),
              const TermsAndConditionsWidget(),
              const SizedBox(height: 48),
              state is SignUpLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomButton(
                      text: AppStrings.signup,
                      color: authCubit.isTermsAndConditionsAccepted == true
                          ? null
                          : AppColors.transparent,
                      borderColor: AppColors.primaryColor,
                      onPressed: () async {
                        if (authCubit.isTermsAndConditionsAccepted == true) {
                          if (authCubit.signUpFormKey.currentState!
                              .validate()) {
                            await authCubit.signUpWithEmailAndPassword();
                          }
                        }
                      }),
            ],
          ),
        );
      },
    );
  }

  void showToast(BuildContext context, String message) {
    CherryToast.success(
      inheritThemeColors: true,
      title: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      borderRadius: 0,
    ).show(context);
  }
}
