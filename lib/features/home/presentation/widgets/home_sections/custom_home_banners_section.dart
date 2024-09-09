import 'package:flutter/material.dart';

import '../custom_home_banner_widget.dart';

class HomeBannerSection extends StatelessWidget {
  const HomeBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeBannerWidget(),
        SizedBox(height: 24),
      ],
    );
  }
}