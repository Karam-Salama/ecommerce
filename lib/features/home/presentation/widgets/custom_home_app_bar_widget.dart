import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomHomeAppBarWidget extends StatelessWidget {
  const CustomHomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.appName,
                style: AppTextStyle.lato16style,
              ),
              Text(
                'Have A Nice Day',
                style: AppTextStyle.lato16style,
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              customReplacementNavigate(context, '/loginDefault');
            },
            icon: const Icon(
              Icons.logout_rounded,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
