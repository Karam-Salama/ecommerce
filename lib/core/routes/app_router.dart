import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/login.dart';
import '../../features/auth/presentation/views/signUp.dart';
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
    path: "/login",
    builder: (context, state) => const LoginView(),
  ),
  GoRoute(
    path: "/signup",
    builder: (context, state) => const SignUpView(),
  ),
    GoRoute(
    path: "/loginDefault",
    builder: (context, state) => const CustomLoginDefault(),
  ),
]);
