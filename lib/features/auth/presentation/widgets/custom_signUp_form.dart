import '../../../../core/functions/navigation.dart';
import '../auth_cubit/auth_cubit.dart';
import '../auth_cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_btn.dart';
import 'custom_error_bottom_sheet.dart';
import 'custom_name_fields_row.dart';
import 'custom_success_bottom_sheet.dart';
import 'custom_terms_and_conds_widget.dart';
import 'cutom_textField.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {
        if (state is SignUpSuccessState) {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            isScrollControlled: true,
            builder: (context) => SuccessBottomSheet(
              message: 'check your email and activate your account',
              buttonText: 'Done',
              onButtonPressed: () {
                customReplacementNavigate(context, '/loginDefault');
              },
            ),
          );
        } else if (state is SignUpErrorState) {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            isScrollControlled: true,
            builder: (context) => ErrorBottomSheet(
              errorMessage: state.errorMessage,
              buttonText: 'Try Again',
              onButtonPressed: () {
                Navigator.of(context).pop();
              },
            ),
          );
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
                validator: Validation.validateEmail,
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
                validator: Validation.validatePassword,
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
                validator: (value) => Validation.validateConfirmPassword(
                  value,
                  authCubit.password ?? '',
                ),
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
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
