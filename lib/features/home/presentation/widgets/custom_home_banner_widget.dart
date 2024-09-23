
import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0), // Maintain the radius here
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.assetsImagesBannersSales,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              right: -15,
              bottom: 10,
              child: Image.asset(
                Assets.assetsImagesBannersYoungBeautifulGirl,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
