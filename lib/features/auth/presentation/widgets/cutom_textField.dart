// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool? obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.onChanged,
    this.onFieldSubmitted,
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
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
          },
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText!,
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
