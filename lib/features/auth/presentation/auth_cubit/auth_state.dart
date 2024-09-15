class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoadingState extends AuthState {}

final class SignUpSuccessState extends AuthState {}

final class SignUpErrorState extends AuthState {
  final String errorMessage;
  SignUpErrorState({required this.errorMessage});
}

final class UpdateTermsAndConditionsState extends AuthState {}

final class ObscurePasswordTextUpdateState extends AuthState {}

final class SignInLoadingState extends AuthState {}

final class SignInSuccessState extends AuthState {}

final class SignInErrorState extends AuthState {
  final String errorMessage;
  SignInErrorState({required this.errorMessage});
}

final class ResetPasswordLoadingState extends AuthState {}

final class ResetPasswordSuccessState extends AuthState {}

final class ResetPasswordErrorState extends AuthState {
  final String errorMessage;
  ResetPasswordErrorState({required this.errorMessage});
}

  