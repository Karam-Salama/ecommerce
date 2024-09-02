import 'package:go_router/go_router.dart';

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
]);
