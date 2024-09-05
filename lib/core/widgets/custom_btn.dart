import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color,
    this.borderColor,
    required this.text,
    required this.onPressed,
    this.icon, // New property for an optional icon
  });

  final Color? color;
  final Color? borderColor;
  final String? text;
  final VoidCallback? onPressed;
  final Icon? icon; // Icon property

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!, // Display icon if it's not null
              const SizedBox(width: 8), // Space between icon and text
            ],
            Text(
              text!,
              style: AppTextStyle.lato16style,
            ),
          ],
        ),
      ),
    );
  }
}
