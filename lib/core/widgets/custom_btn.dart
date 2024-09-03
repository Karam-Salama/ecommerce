// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.color,required this.text,required this.onPressed});

  final Color? color;
  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          text!,
          style: CustomTextStyles.lato16style,
        ),
      ),
    );
  }
}
