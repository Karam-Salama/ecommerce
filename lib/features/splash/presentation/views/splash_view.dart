import '../../../../core/database/cache/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      FirebaseAuth.instance.currentUser == null
          ? delayedNavigate(context, "/loginDefault")
          : FirebaseAuth.instance.currentUser!.emailVerified == true ? delayedNavigate(context, "/homeNavBar") : delayedNavigate(context, "/loginDefault");
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
