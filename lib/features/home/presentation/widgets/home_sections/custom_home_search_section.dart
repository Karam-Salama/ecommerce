import 'package:flutter/material.dart';

import '../custom_home_search_bar_wiget.dart';

class HomeSearchSection extends StatelessWidget {
  const HomeSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomSearchBar(),
        SizedBox(height: 24),
      ],
    );
  }
}