import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;
  String? confirmPassword;
  bool? isTermsAndConditionsAccepted = false;
  bool? obscurePasswordTextValue = true;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey();

  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      await addUserProfile();
      await verifyEmail();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      _signUpHandelException(e);
    } catch (e) {
      emit(SignUpErrorState(errorMessage: e.toString()));
    }
  }

  void updateTermsAndConditionsCheckbox({required bool newValue}) {
    isTermsAndConditionsAccepted = newValue;
    emit(UpdateTermsAndConditionsState());
  }

  void _signUpHandelException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      // ! emit sign up error state
      emit(
          SignUpErrorState(errorMessage: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      // ! emit sign up error state
      emit(SignUpErrorState(
          errorMessage: 'The account already exists for that email.'));
    }
    if (e.code == 'invalid-email') {
      // ! emit sign up error state
      emit(SignUpErrorState(errorMessage: 'Invalid email address.'));
    } else {
      // ! emit sign up error state
      emit(SignUpErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      // ? emit sign in loading state
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      // * emit sign in success state
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      _signInHandelException(e);
    } catch (e) {
      // ! emit sign in error state
      emit(SignInErrorState(errorMessage: e.toString()));
    }
  }

  void _signInHandelException(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      // ! emit sign in error state
      emit(SignInErrorState(errorMessage: 'No user found for that email.'));
    } else if (e.code == 'wrong-password') {
      // ! emit sign in error state
      emit(SignInErrorState(
          errorMessage: 'Wrong password provided for that user.'));
    } else {
      // ! emit sign in error state
      emit(SignInErrorState(errorMessage: "Check your email and password"));
    }
  }

  Future<void> resetPasswordWithLink() async {
    try {
      // ? emit reset password loading state
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      // * emit reset password success state
      emit(ResetPasswordSuccessState());
    } catch (e) {
      // ! emit reset password error state
      emit(ResetPasswordErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> addUserProfile() async {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.add({
      'emailAddress': emailAddress,
      'firstName': firstName,
      'lastName': lastName,
    });
  }
}
