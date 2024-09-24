// ignore_for_file: must_be_immutable, file_names

import 'package:ecommerce_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubit/auth_state.dart';
import 'custom_error_bottom_sheet.dart';
import 'custom_success_bottom_sheet.dart';

class CustomSocialBtns extends StatelessWidget {
  CustomSocialBtns({super.key, this.text1, this.text2});
  String? text1;
  String? text2;

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
        return Column(
          children: [
            CustomButton(
              icon: const Icon(
                Icons.g_mobiledata_rounded,
                color: AppColors.primaryColor,
                size: 25,
              ),
              text: text1!,
              color: AppColors.backgroundColor,
              borderColor: AppColors.primaryColor,
              onPressed: () {
                authCubit.signInWithGoogle();
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              icon: const Icon(
                Icons.apple_rounded,
                color: AppColors.primaryColor,
                size: 25,
              ),
              text: text2!,
              color: AppColors.backgroundColor,
              borderColor: AppColors.primaryColor,
              onPressed: () {
                authCubit.signInWithApple();
              },
            ),
          ],
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
          title: 'Login Successful',
          buttonText1: 'Go To Home',
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
          title: 'Please Verify Your Email Address',
          buttonText1: 'Let\'s Go To Verification',
          onButtonPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );
    }
  }
}
