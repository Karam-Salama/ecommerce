import 'package:flutter/material.dart';

import 'custom_welcome_subtitle.dart';
import 'custom_welcome_title.dart';

class CustomWelcomeBody extends StatelessWidget {
  const CustomWelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 315),
        WelcomeTitle(),
        SizedBox(height: 8),
        WelcomeSubtitle(),
      ],
    );
  }
}
