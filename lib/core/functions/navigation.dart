
import 'package:go_router/go_router.dart';

void customReplacementNavigate(context,String route) {
    GoRouter.of(context).pushReplacement(route);
  }

  void customNavigate(context,String route) {
    GoRouter.of(context).push(route);
  }