// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(color: AppColors.greyColor, fontSize: 14.0),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: const TextStyle(color: AppColors.greyColor, fontSize: 12.0),
          decoration: InputDecoration(
            enabledBorder: getBorderStyle(),
            focusedBorder: getBorderStyle(),
            border: getBorderStyle(),
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.greyColor),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder getBorderStyle() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: AppColors.greyColor,
      width: 1.0,
    ),
  );
}