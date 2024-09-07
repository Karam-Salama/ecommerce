import '../auth_cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubit/auth_cubit.dart';
import 'custom_error_bottom_sheet.dart';
import 'custom_header_widget.dart';
import 'custom_success_bottom_sheet.dart';
import 'cutom_textField.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {
        if (state is SignInSuccessState) {
          handleSomeCasesInSuccessStateForSignIn(context);
        } else if (state is SignInErrorState) {
          handleSomeCasesInErrorStateForSignIn(context, state);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.loginFormKey,
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
              const SizedBox(height: 16),
              CustomTextFormField(
                labelText: AppStrings.password,
                hintText: AppStrings.enterPassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: authCubit.obscurePasswordTextValue,
                onChanged: (password) {
                  authCubit.password = password;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                  icon: Icon(
                    authCubit.obscurePasswordTextValue == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomHeaderWidget(
                onPressed: () {
                  customReplacementNavigate(context, '/forgotPassword');
                },
                text: AppStrings.forgotPassword,
                alignment: Alignment.centerRight,
                textStyle: AppTextStyle.lato16style,
                padding: const EdgeInsets.symmetric(horizontal: 0),
              ),
              const SizedBox(height: 48),
              state is SignInLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomButton(
                      text: AppStrings.login,
                      onPressed: () async {
                        if (authCubit.loginFormKey.currentState!.validate()) {
                          await authCubit.signInWithEmailAndPassword();
                        }
                      }),
              const SizedBox(height: 48),
            ],
          ),
        );
      },
    );
  }

  void handleSomeCasesInErrorStateForSignIn(
      BuildContext context, SignInErrorState state) {
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

  void handleSomeCasesInSuccessStateForSignIn(BuildContext context) {
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
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
          message: 'Login Successful',
          buttonText: 'Go To Home',
          onButtonPressed: () {
            customReplacementNavigate(context, '/homeNavBar');
          },
        ),
      );
    } else {
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
          message: 'Please Verify Your Email Address',
          buttonText: 'Let\'s Go To Verification',
          onButtonPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );
    }
  }
}
