import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class BuildMenuItem extends StatelessWidget {
  const BuildMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,
          color: isLogout ? AppColors.redColor : AppColors.whiteColor),
      title: Text(
        title,
        style: TextStyle(
            color: isLogout ? AppColors.redColor : AppColors.whiteColor),
      ),
      trailing: isLogout
          ? null
          : Icon(Icons.arrow_forward_ios, color: AppColors.whiteColor),
      onTap: onTap,
    );
  }
}
