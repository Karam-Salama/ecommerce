import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/views/default_sign_in_view.dart';
import '../../features/auth/presentation/views/default_sign_up_view.dart';
import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/home/presentation/widgets/custom_home_nav_bar_widget.dart';
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
    path: "/signUpDefault",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const DefaultSignUpView(),
    ),
  ),
  GoRoute(
    path: "/login",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const LoginView(),
    ),
  ),
  GoRoute(
    path: "/loginDefault",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const DefaultSignInView(),
    ),
  ),
  GoRoute(
    path: "/home",
    builder: (context, state) => const HomeView(),
  ),
  GoRoute(
    path: "/homeNavBar",
    builder: (context, state) => HomeNavBarWidget(),
  ),
  GoRoute(
    path: "/forgotPassword",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const ForgetPassword(),
    ),
  ),
]);
