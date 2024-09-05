import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/default_sign_in_view.dart';
import '../../features/auth/presentation/views/default_sign_up_view.dart';
import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/welcome/presentation/views/welcome_view.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: "/welcome",
    builder: (context, state) => const WelcomeView(),
  ),
  GoRoute(
    path: "/signup",
    builder: (context, state) => const SignUpView(),
  ),
  GoRoute(
    path: "/signUpDefault",
    builder: (context, state) => const DefaultSignUpView(),
  ),
  GoRoute(
    path: "/login",
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    path: "/loginDefault",
    builder: (context, state) => const DefaultSignInView(),
  ),
]);
