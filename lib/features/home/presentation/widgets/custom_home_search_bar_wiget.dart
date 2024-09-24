import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          children: <Widget>[
            Icon(Icons.search, color: AppColors.greyColor),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Find your favorite items',
                  hintStyle: TextStyle(color: AppColors.greyColor),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: AppColors.greyColor),
              ),
            ),
            Image(
              image: AssetImage(
                Assets.assetsImagesIconsSearch,
              ),
              width: 19,
              height: 19,
            )
          ],
        ),
      ),
    );
  }
}
