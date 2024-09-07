import '../../../../core/functions/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubit/auth_cubit.dart';
import '../auth_cubit/auth_state.dart';
import 'custom_error_bottom_sheet.dart';
import 'custom_success_bottom_sheet.dart';
import 'cutom_textField.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          // Show Success Bottom Sheet
          handleSomeCasesInSuccessStateForForgetPassword(context);
        } else if (state is ResetPasswordErrorState) {
          // Show Error Bottom Sheet
          handleSomeCasesInErrorStateForForgetPassword(context, state);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.forgetPasswordFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.email,
                hintText: AppStrings.enterEmail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
                validator: Validation.validateEmail,
              ),
              const SizedBox(height: 48),
              state is ResetPasswordLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomButton(
                      text: AppStrings.sendResetPasswordLink,
                      onPressed: () async {
                        if (authCubit.forgetPasswordFormKey.currentState!
                            .validate()) {
                          await authCubit.resetPasswordWithLink();
                        }
                      },
                    ),
              const SizedBox(height: 48),
            ],
          ),
        );
      },
    );
  }

  void handleSomeCasesInErrorStateForForgetPassword(BuildContext context, ResetPasswordErrorState state) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ErrorBottomSheet(
          errorMessage: state.errorMessage,
          buttonText: 'Retry',
          onButtonPressed: () {
            Navigator.pop(context); // Close the bottom sheet
          },
        );
      },
    );
  }

  void handleSomeCasesInSuccessStateForForgetPassword(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SuccessBottomSheet(
          message: 'Check your email and Reset Password',
          buttonText: 'Done',
          onButtonPressed: () {
            customReplacementNavigate(
                context, '/loginDefault'); // Close the bottom sheet
          },
        );
      },
    );
  }
}
