import 'package:ecommerce_app/core/database/cache/cache_helper.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/service/service_locator.dart';
import '../../../../core/utils/app_assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool welcomeVisited =
        getIt<CacheHelper>().getData(key: "welcomeVisited") ?? false;
    if (welcomeVisited) {
      delayedNavigate(context, "/login");
    } else {
      delayedNavigate(context, "/welcome");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 189.36,
          height: 50,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.assetsImagesLogoSplash),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

void delayedNavigate(context, path) {
  Future.delayed(const Duration(seconds: 3), () {
    customReplacementNavigate(context, path);
  });
}
