
import 'package:go_router/go_router.dart';

void customNavigate(context,String route) {
    GoRouter.of(context).push("/welcome");
  }