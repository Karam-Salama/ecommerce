import 'package:ecommerce_app/core/functions/navigation.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Home', style: TextStyle(color: AppColors.whiteColor)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            customReplacementNavigate(context, '/loginDefault');
          },
          icon: const Icon(Icons.logout_rounded),
        ),
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
