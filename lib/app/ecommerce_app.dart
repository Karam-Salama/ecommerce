import 'package:flutter/material.dart';

import '../core/routes/app_router.dart';
import '../core/utils/app_colors.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}