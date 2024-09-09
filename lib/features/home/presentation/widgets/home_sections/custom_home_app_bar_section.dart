import 'package:flutter/material.dart';

import '../custom_home_app_bar_widget.dart';

class HomeAppBarSection extends StatelessWidget {
  const HomeAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 24),
        CustomHomeAppBarWidget(),
        SizedBox(height: 24),
      ],
    );
  }
}