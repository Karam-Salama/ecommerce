import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Add a post-frame callback to navigate after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      delayedNavigate(context, mounted);
    });
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

void delayedNavigate(context, mounted) {
  Future.delayed(const Duration(seconds: 3), () {
    if (mounted) {
      customReplacementNavigate(context, "/welcome");
    }
  });
}
