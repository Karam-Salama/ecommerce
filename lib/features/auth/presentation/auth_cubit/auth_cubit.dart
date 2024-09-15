import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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

  Future<UserCredential?> signInWithGoogle() async {
    try {
      emit(SignInLoadingState());

      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      if (userAccount == null) {
        // Handle the case where the user canceled the sign-in
        emit(SignInErrorState(errorMessage: 'Sign in aborted by user'));
        return null;
      }

      // Obtain the authentication details
      final GoogleSignInAuthentication googleAuth =
          await userAccount.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      emit(SignInSuccessState());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors
      _signInWithGoogleHandleException(e);
      emit(SignInErrorState(
          errorMessage: 'FirebaseAuthException: ${e.message}'));
      return null;
    } catch (e) {
      // Handle any other errors
      emit(SignInErrorState(errorMessage: 'Error during Google sign-in: $e'));
      return null;
    }
  }

  void _signInWithGoogleHandleException(FirebaseAuthException e) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        if (kDebugMode) print('Account exists with different credential');
        break;
      case 'invalid-credential':
        if (kDebugMode) print('Invalid credential');
        break;
      case 'user-disabled':
        if (kDebugMode) print('User disabled');
        break;
      case 'user-not-found':
        if (kDebugMode) print('User not found');
        break;
      case 'wrong-password':
        if (kDebugMode) print('Wrong password');
        break;
      case 'network-request-failed':
        if (kDebugMode) print('Network request failed');
        break;
      case 'too-many-requests':
        if (kDebugMode) print('Too many requests');
        break;
      case 'operation-not-allowed':
        if (kDebugMode) print('Operation not allowed');
        break;
      default:
        if (kDebugMode) print('FirebaseAuthException: ${e.message}');
        break;
    }
  }

  Future<UserCredential?> signInWithApple() async {
    try {
      emit(SignInLoadingState());

      // Trigger the Apple sign-in flow
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'com.example.clientId',
          redirectUri:
              Uri.parse('https://example.com/callbacks/sign_in_with_apple'),
        ),
      );

      // Create a new credential
      final oAuthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      // Once signed in, return the UserCredential
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(oAuthCredential);

      emit(SignInSuccessState());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors
      _signInWithAppleHandleException(e);
      emit(SignInErrorState(
          errorMessage: 'FirebaseAuthException: ${e.message}'));
      return null;
    } catch (e) {
      // Handle any other errors
      emit(SignInErrorState(errorMessage: 'Error during Apple sign-in: $e'));
      return null;
    }
  }

  void _signInWithAppleHandleException(FirebaseAuthException e) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        if (kDebugMode) print('Account exists with different credential');
        break;
      case 'invalid-credential':
        if (kDebugMode) print('Invalid credential');
        break;
      case 'user-disabled':
        if (kDebugMode) print('User disabled');
        break;
      case 'user-not-found':
        if (kDebugMode) print('User not found');
        break;
      case 'wrong-password':
        if (kDebugMode) print('Wrong password');
        break;
      case 'network-request-failed':
        if (kDebugMode) print('Network request failed');
        break;
      case 'too-many-requests':
        if (kDebugMode) print('Too many requests');
        break;
      case 'operation-not-allowed':
        if (kDebugMode) print('Operation not allowed');
        break;
      default:
        if (kDebugMode) print('FirebaseAuthException: ${e.message}');
        break;
    }
  }
}
